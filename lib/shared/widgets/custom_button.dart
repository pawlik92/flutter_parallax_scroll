import 'package:flutter/material.dart';
import 'package:flutter_parallax_scroll/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
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
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        onPressed: onPressed,
        color: CustomColors.orange,
        textColor: Colors.white,
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
