import 'package:flutter/material.dart';
import 'package:tasky/Core/assets_manager.dart';

class LandingImage extends StatelessWidget {
  const LandingImage({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
     double screenheight = MediaQuery.of(context).size.height;
    return Image.asset(
      ImagesManager.landingImage,
      height: screenheight * .6,
      width: double.infinity,
      fit: BoxFit.fitHeight,
    );
  }
}