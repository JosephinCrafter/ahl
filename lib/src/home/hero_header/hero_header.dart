import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ahl_barrel.dart';

class HeroHeaderView extends StatelessWidget {
  const HeroHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return const Stack(
          children: [
            Image(
              image: AssetImage(
                AhlAssets.heroBkAlt,
              ),
            ),
            HeroTextView(),
          ],
        );
      },
    );
  }
}

class HeroTextView extends StatelessWidget {
  const HeroTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: GoogleFonts.pendingFonts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Text(
                  AppLocalizations.of(context)!.heroTitle,
                  style: GoogleFonts.getFont(
                    'Lato',
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                );

              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}
