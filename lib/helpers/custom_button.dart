import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.callBack, required this.buttonTitle}) : super(key: key);
  final Function callBack;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callBack();
        } ,

        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 40)
        ),
      child: Text(buttonTitle!),
    );
  }
}
