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
        switch (constraints.maxWidth) {
          case <= ScreenSizes.mobile:
            //todo: Add the mobile implementation of hero header
            return Container(
              constraints: const BoxConstraints(
                maxHeight: 350,
              ),
              child: const HeroImageView(isWithBorder: false),
            );
          default:
            return Container(
              constraints: const BoxConstraints(
                maxHeight: 700,
                maxWidth: 1720,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: Margins.big,
              ),
              child: const Stack(
                children: [
                  HeroImageView(),
                  HeroTextView(),
                ],
              ),
            );
        }
      },
    );
  }
}

class HeroImageView extends StatelessWidget {
  const HeroImageView({
    super.key,
    this.isWithBorder = true,
  });

  final bool isWithBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isWithBorder
            ? BorderRadius.circular(
                BorderSizes.circularBorderSize,
              )
            : null,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AhlAssets.heroBk),
        ),
      ),
    );
  }
}

class HeroTextView extends StatelessWidget {
  const HeroTextView({super.key});

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
