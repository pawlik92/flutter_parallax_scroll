import 'package:flutter/material.dart';
import 'subscreens/benefits_subscreen.dart';
import 'subscreens/urban_planners_subscreen.dart';
import '../../shared/colors.dart';
import '../../shared/consts.dart';
import '../../shared/widgets/paralax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();
  bool _disabled3D = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColors.backgroundGreen,
        child: ParallaxScroll(
          controller: controller,
          physic: const ClampingScrollPhysics(),
          parallaxBackgroundChildren: _buildParallaxElements(),
          parallaxForegroundChildren: [
            ParallaxElement(
              child: _buildEffectToggle(),
            )
          ],
          children: [
            UrbanPlannersSubscreen(controller: controller),
            BenefitsSubscreen(controller: controller),
          ],
        ),
      ),
    );
  }

  List<ParallaxElement> _buildParallaxElements() {
    return [
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/background_icons.svg',
          translationOffset: Consts.svgBackgroundIconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer3.svg',
          translationOffset: Consts.svgLayersOffset,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer3_icons.svg',
          translationOffset: Consts.svgLayer3IconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 150),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer2.svg',
          translationOffset: Consts.svgLayersOffset,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 150),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer2_icons.svg',
          translationOffset: Consts.svgLayer2IconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 40),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer1.svg',
          translationOffset: Consts.svgLayersOffset,
        ),
      ),
    ];
  }

  Widget _buildEffectToggle() {
    return IconButton(
      icon: Icon(
        _disabled3D ? Icons.blur_off : Icons.blur_on,
        color: CustomColors.green3,
        size: 30,
      ),
      tooltip: 'On/Off 3D effect',
      onPressed: () {
        setState(() => _disabled3D = !_disabled3D);
      },
    );
  }
}
