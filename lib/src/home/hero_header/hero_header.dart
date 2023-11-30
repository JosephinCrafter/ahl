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
          // HeroHeader fo mobile
          case <= ScreenSizes.mobile:
            return const MobileHeroHeader();
          default:
            return const DefaultHeroHeader();
        }
      },
    );
  }
}

class MobileHeroHeader extends StatefulWidget {
  const MobileHeroHeader({super.key});

  @override
  State<MobileHeroHeader> createState() => _MobileHeroHeaderState();
}

class _MobileHeroHeaderState extends State<MobileHeroHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 350,
          ),
          child: const HeroImageView(isWithBorder: false),
        ),
        Container(
          margin: const EdgeInsets.only(top: 513),
          child: const HeroTextView(),
        ),
      ],
    );
  }
}

class DefaultHeroHeader extends StatefulWidget {
  const DefaultHeroHeader({super.key});

  @override
  State<DefaultHeroHeader> createState() => _DefaultHeroHeaderState();
}

class _DefaultHeroHeaderState extends State<DefaultHeroHeader> {
  @override
  Widget build(BuildContext context) {
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
  const HeroTextView({super.key, this.needMargin = false});

  final bool needMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: needMargin ? Margins.heroHeaderExtraTop : 0,
      ),
      height: HeroHeaderGeometry.heroHeaderExtrasHeight,
      child: Column(
        children: [
          FutureBuilder(
            future: GoogleFonts.pendingFonts(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.heroTitle,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontFamily: 'Butler',
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(AppLocalizations.of(context)!.heroExplanation,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontFamily: 'Aileron')),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.aboutUs,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: Text(AppLocalizations.of(context)!.prayers),
                          )
                        ],
                      )
                    ],
                  );

                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
