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
            return Center(
              child: Text(
                'Replace with mobile Hero header',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              ),
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
  const HeroImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BorderSizes.circularBorderSize,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AhlAssets.heroBk),
        ),
      ),
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
