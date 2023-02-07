import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.callBack, required this.buttonChild, this.width, this.height}) : super(key: key);
  final Function callBack;
  final Widget? buttonChild;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callBack();
        } ,

        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? 200, height ?? 40)
        ),
      child: buttonChild!,
    );
  }
}
