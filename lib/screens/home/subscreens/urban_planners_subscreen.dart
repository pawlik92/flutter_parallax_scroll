import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class UrbanPlannersSubscreen extends StatelessWidget {
  const UrbanPlannersSubscreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 200),
        Text(
          'Lots. For little'.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: CustomColors.textGreen,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Urban \nPlanners',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: CustomColors.headerText,
            fontSize: 60,
            fontWeight: FontWeight.w800,
            height: .9,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 70,
          height: 5,
          child: Container(
            color: CustomColors.orange,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Location matters as much as \nyour house, we focus on the \nwhole experience of real estate.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: CustomColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            controller!.animateTo(1540,
                duration: const Duration(milliseconds: 2300),
                curve: Curves.ease);
          },
          child: Text(
            'Show more',
            style: GoogleFonts.nunito(
              color: CustomColors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 330),
        _buildExteriorInfoSection(),
        const SizedBox(height: 370),
      ],
    );
  }

  Widget _buildExteriorInfoSection() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Get the \nbest view',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                color: CustomColors.headerText,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'We know all the \nsweet spots \nin your region.',
              style: GoogleFonts.nunito(
                color: CustomColors.text,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
