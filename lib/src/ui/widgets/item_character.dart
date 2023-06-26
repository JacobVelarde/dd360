

import 'package:flutter/material.dart';
import 'package:test_dd360/src/utils/custom_styles.dart';

import '../../utils/custom_colors.dart';

class ItemCharacter extends StatelessWidget {

  String pathImage;
  String name;
  VoidCallback onTap;

  ItemCharacter({
    required this.pathImage,
    required this.name,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: CustomColors.grayAB,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Image.network(pathImage, fit: BoxFit.cover,),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.05,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: CustomColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: styles.normalBold(
                              fontSize: 15.0
                          ),
                        ),
                      ],
                    )
                ),
              )
            ],
          )),
    );
  }
}
