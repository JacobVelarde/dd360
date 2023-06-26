import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_dd360/routes/comic_routes.dart';
import 'package:test_dd360/src/bloc/character_detail_bloc.dart';
import 'package:test_dd360/src/bloc/main_bloc.dart';
import 'package:test_dd360/src/model/result.dart';
import 'package:test_dd360/src/ui/main/character_detail_screen.dart';
import 'package:test_dd360/src/ui/main/main_screen.dart';
import 'package:test_dd360/src/utils/comic_extensions.dart';
import 'package:test_dd360/src/utils/custom_transitions.dart';

import 'network/dio_configuration.dart';
import 'network/dio_provider.dart';

void main() {
  final Map<String, dynamic> appConfig = {
    'base_url':'https://gateway.marvel.com:443',
    'public_key':'fea4ddbf370376865724c2b03db5ffef',
    'private_key':'dcca949708ec8a3a3b97cf51cacf65cd98a314c4'
  };

  final dio = getDio(appConfig);

  final multiProvider = MultiProvider(
    providers: [
      Provider<Map<String, dynamic>>(create: (_) => appConfig),
      Provider<DioProvider>(create: (_) => DioProvider(
          dio: dio,
          publicKey: appConfig['public_key'],
          privateKey: appConfig['private_key']
      )),
    ],
    child:MaterialApp(
      title: "Comic",
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            )
        ),
      ),
      initialRoute: ComicRoutes.mainScreen,
      onGenerateRoute: (settings) {
        switch (settings.name){
          case ComicRoutes.mainScreen:
            return customSlideTransaction(
                settings: settings,
                pageBuilder: (routeContext, __, _) => Provider<MainBloc>(
                  create: (_) => generateMainBloc(routeContext),
                  dispose: (_, bloc) => bloc.dispose(),
                  child: const MainScreen(),
                )
            );

          case ComicRoutes.characterDetailScreen:
            return customSlideTransaction(
                settings: settings,
                pageBuilder: (routeContext, __, _) => Provider<CharacterDetailBloc>(
                  create: (_) => generateCharacterDetailBloc(routeContext),
                  dispose: (_, bloc) => bloc.dispose(),
                  child: CharacterDetailScreen(character: settings.arguments as Result),
                )
            );
        }
      },
    )
  );

  WidgetsFlutterBinding.ensureInitialized();

  runApp(multiProvider);}
