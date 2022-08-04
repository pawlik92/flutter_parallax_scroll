import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BenefitsSubscreen extends StatelessWidget {
  const BenefitsSubscreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 200.0),
        Text(
          'All inclusive estate'.toUpperCase(),
          style: GoogleFonts.nunito(
            color: CustomColors.textGreen,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Benefits',
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
          'Get the most out of your buck,\nwe know the best spots.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: CustomColors.text,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'We don\'t just find prime quality \nfor affordable prices, we also find\n the right community for you.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: CustomColors.text,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 45),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SvgLabel(
              assetName: 'assets/svg/mountains.svg',
              label: 'Prime \nview',
            ),
            SizedBox(width: 45),
            SvgLabel(
              assetName: 'assets/svg/stars.svg',
              label: 'Excellent \nquality',
            ),
            SizedBox(width: 45),
            SvgLabel(
              assetName: 'assets/svg/money.svg',
              label: 'Good \nprices',
            ),
          ],
        ),
        const SizedBox(height: 90),
        Align(
          alignment: const Alignment(.8, 0.0),
          child: CustomButton(
            text: 'Get in touch',
            minWidth: 200,
            onPressed: () {
              controller!.animateTo(0,
                  duration: const Duration(milliseconds: 2300),
                  curve: Curves.ease);
            },
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
