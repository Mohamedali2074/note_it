import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function()? onPressed;
  final int? width;
  final bool isLoading;

  const MainButton({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.onPressed,
    this.width = 200,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!.toDouble(),
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: backgroundColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : Text(
                text,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
      ),
    );
  }
}
