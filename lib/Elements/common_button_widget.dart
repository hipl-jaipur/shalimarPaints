import 'package:flutter/material.dart';
import 'package:shalimar/utils/colors.dart';



  class CustomButton extends StatelessWidget {
  final String? btnName;
  final VoidCallback? onPressed;
  final bool? isVisible;
  final Color? buttonColor;

  const CustomButton(
      {Key? key, required this.btnName, required this.onPressed, this.isVisible, this.buttonColor, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(top: 16,bottom: 16),
          child: Center(
              child: Text(
            btnName!,
            style: TextStyle(
                color: primaryLight,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito Sans'),
          )),
        ),
      ),
    );
  }
}
