import 'package:flutter/widgets.dart';
import '../colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SvgLabel extends StatelessWidget {
   const SvgLabel({Key? key, 
    required this.assetName,
    required this.label,
  }) : super(key: key);

  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SvgPicture.asset(
        assetName,
      ),
      const SizedBox(height: 22.0),
      Text(
        label.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          color: CustomColors.textGreen,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          height: .9,
        ),
      ),
    ]);
  }
}
