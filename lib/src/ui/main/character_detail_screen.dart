

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_dd360/src/bloc/character_detail_bloc.dart';
import 'package:test_dd360/src/data/utils/status_network.dart';
import 'package:test_dd360/src/model/result.dart';
import 'package:test_dd360/src/model/result_comic.dart';
import 'package:test_dd360/src/model/result_events.dart';
import 'package:test_dd360/src/model/result_series.dart';
import 'package:test_dd360/src/model/result_stories.dart';
import 'package:test_dd360/src/ui/widgets/custom_header_back.dart';
import 'package:test_dd360/src/ui/widgets/item_character.dart';
import 'package:test_dd360/src/ui/widgets/section_detail.dart';
import 'package:test_dd360/src/utils/custom_colors.dart';
import 'package:test_dd360/src/utils/custom_styles.dart';

class CharacterDetailScreen extends StatelessWidget {

  Result character;

  CharacterDetailScreen({
    required this.character,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    CharacterDetailBloc bloc = Provider.of<CharacterDetailBloc>(context, listen: false);
    bloc.loadCharacter(character);

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderBack(onTap: (){
              Navigator.of(context).pop();
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.3,
                      child: ItemCharacter(
                          pathImage: '${character.thumbnail!.path!}.${character.thumbnail!.extension!.name}',
                          name: character.name ?? "",
                          onTap: (){}
                      ),
                    ),
                    SectionDetail(
                        title: "Comic",
                        futureData: bloc.getData(TypeData.comics),
                        builder: (context, object){
                          List<ResultComic> list = object as List<ResultComic>;
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                ResultComic comic = list[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      comic.thumbnail != null ? Expanded(
                                          flex: 1,
                                          child: Image.network('${comic.thumbnail?.path ?? ""}.${comic.thumbnail?.extension?.name ?? ""}')
                                      ) : Container(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          comic.title ?? "Not found",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: styles.normal(color: CustomColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                    ),
                    SectionDetail(
                        title: "Events",
                        futureData: bloc.getData(TypeData.events),
                        builder: (context, object){
                          List<ResultEvents> list = object as List<ResultEvents>;
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                ResultEvents comic = list[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      comic.thumbnail != null ? Expanded(
                                          flex: 1,
                                          child: Image.network('${comic.thumbnail?.path ?? ""}.${comic.thumbnail?.extension?.name ?? ""}')
                                      ) : Container(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          comic.title ?? "Not found",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: styles.normal(color: CustomColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                    ),
                    SectionDetail(
                        title: "Series",
                        futureData: bloc.getData(TypeData.series),
                        builder: (context, object){
                          List<ResultSeries> list = object as List<ResultSeries>;
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                ResultSeries comic = list[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      comic.thumbnail != null ? Expanded(
                                          flex: 1,
                                          child: Image.network('${comic.thumbnail?.path ?? ""}.${comic.thumbnail?.extension?.name ?? ""}')
                                      ) : Container(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          comic.title ?? "Not found",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: styles.normal(color: CustomColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                    ),
                    SectionDetail(
                        title: "Stories",
                        futureData: bloc.getData(TypeData.stories),
                        builder: (context, object){
                          List<ResultStories> list = object as List<ResultStories>;
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index){
                                ResultStories comic = list[index];
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 100,
                                  child: Row(
                                    children: [
                                      comic.thumbnail != null ? Expanded(
                                          flex: 1,
                                          child: Image.network('${comic.thumbnail?.path ?? ""}.${comic.thumbnail?.extension?.name ?? ""}')
                                      ) : Container(),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          comic.title ?? "Not found",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: styles.normal(color: CustomColors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
