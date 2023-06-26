

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dd360/routes/comic_routes.dart';
import 'package:test_dd360/src/bloc/main_bloc.dart';
import 'package:test_dd360/src/data/utils/status_network.dart';
import 'package:test_dd360/src/ui/widgets/item_character.dart';
import 'package:test_dd360/src/utils/custom_colors.dart';
import 'package:test_dd360/src/utils/custom_styles.dart';

import '../../model/result.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    MainBloc bloc = Provider.of<MainBloc>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.black,
        body: StreamBuilder(
          stream: bloc.observerStatusNetwork,
          initialData: StatusNetwork(Status.loading),
          builder: (context, snapshot){
            StatusNetwork statusNetwork = snapshot.data!;
            switch (statusNetwork.status){

              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(color: CustomColors.orange),
                );
              case Status.ready:
                List<Result> result = snapshot.data!.data as List<Result>;
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (1 / 1.4)
                    ),
                    itemCount: result.length,
                    itemBuilder: (context, index){
                      String path = '${result[index].thumbnail!.path!}.${result[index].thumbnail!.extension!.name}';
                      return ItemCharacter(pathImage: path, name: result[index].name!, onTap: () {
                        Navigator.of(context).pushNamed(ComicRoutes.characterDetailScreen, arguments: result[index]);
                      });
                    }
                );
              case Status.errorInternet:
                return Center(
                  child: Text(
                    'Revisa tu conexión a Internet',
                    style: styles.subtitleBold(),
                  ),
                );
              case Status.errorBack:
                return Center(
                  child: Text(
                    'Estamos en mantenimiento, intenta de nuevo mas tarde.',
                    style: styles.subtitleBold(),
                  ),
                );
                break;
            }
          },
        ),
      )
    );
  }
}
