import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroHeaderView extends StatelessWidget {
  const HeroHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return const Stack(
          children: [
            Placeholder(),
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
            builder: (context, snapshot) => (true == snapshot.hasData)
                ? Text(
                    AppLocalizations.of(context)!.heroTitle,
                    style: GoogleFonts.getFont(
                      'Lato',
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                  )
                : Container()),
      ],
    );
  }
}
