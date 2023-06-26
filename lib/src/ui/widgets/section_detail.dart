
import 'package:flutter/material.dart';
import 'package:test_dd360/src/data/utils/status_network.dart';
import 'package:test_dd360/src/utils/custom_colors.dart';
import 'package:test_dd360/src/utils/custom_styles.dart';

typedef SectionDetailBuilder = Widget Function(BuildContext context, Object data);

class SectionDetail extends StatelessWidget {

  String title;
  Future<StatusNetwork> futureData;
  final SectionDetailBuilder builder;

  SectionDetail({
    required this.title,
    required this.futureData,
    required this.builder,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: CustomColors.white,
      collapsedBackgroundColor: CustomColors.white,
      title: Text(
        title,
        style: styles.normalBold(),
      ),
      children: [
        FutureBuilder<StatusNetwork>(
            future: futureData,
            initialData: StatusNetwork(Status.loading),
            builder: (context, snapshot){
              switch(snapshot.data!.status){
                case Status.loading:
                  return const CircularProgressIndicator(
                    color: CustomColors.white,
                  );
                case Status.ready:
                  return builder(context, snapshot.data!.data!);
                case Status.errorInternet:
                  return Center(
                    child: Text(
                      "Lo sentimos, intenta de nuevo mas tarde",
                      style: styles.normalBold(color: CustomColors.black),
                    ),
                  );
                case Status.errorBack:
                  return Center(
                    child: Text(
                      "Lo sentimos, intenta de nuevo mas tarde",
                      style: styles.normalBold(color: CustomColors.black),
                    ),
                  );                                break;
              }
            }
        )
      ],
    );
  }
}
