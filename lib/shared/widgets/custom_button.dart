import 'package:flutter/material.dart';
import 'package:flutter_parallax_scroll/shared/colors.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            primary: CustomColors.orange,
            elevation: 0,
            textStyle: TextStyle(color: Colors.white)),
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
