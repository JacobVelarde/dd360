
import 'package:flutter/material.dart';
import 'package:test_dd360/src/utils/custom_colors.dart';

class CustomHeaderBack extends StatelessWidget {

  VoidCallback onTap;

  CustomHeaderBack({
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: CustomColors.borderGray,
            borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: const Icon(Icons.arrow_back, color: CustomColors.black,),
      ),
    );
  }
}
