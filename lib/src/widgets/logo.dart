import 'package:ahl/src/ahl_barrel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AhlLogo extends StatelessWidget {
  const AhlLogo({super.key});

  @override
  Widget build(BuildContext context) {
    //todo: change this to the real logo
    return Row(
      children: [
        Image.asset(AhlAssets.logoForm),
        Container(
          width: 30,
        ),
        Text(
          "Ajourd'hui l'avenir",
          style: GoogleFonts.playfairDisplay(),
        ),
      ],
    );
  }
}
