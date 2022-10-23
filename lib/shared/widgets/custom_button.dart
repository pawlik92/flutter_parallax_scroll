import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.minWidth = 135.0,
    this.height = 62.0,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final double minWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            backgroundColor: CustomColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 0,
            textStyle: const TextStyle(color: Colors.white)),
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
