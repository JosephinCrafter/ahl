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
        if (constraints.maxWidth <= ScreenSizes.tablet) {
          // HeroHeader fo mobile
          
            return const MobileHeroHeader();
          }else{
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
            maxHeight: Sizes.mobileHeroHeaderImageHeight,
          ),
          child: const HeroImageView(isWithBorder: false),
        ),
        Container(
          margin: const EdgeInsets.only(top: Sizes.mobileHeroHeaderImageHeight),
          child: const HeroTextView(
            needMargin: true,
            margin: 50,
          ),
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
        maxWidth: 1080,
      ),
      alignment: Alignment.center,
      child: Stack(
        children: [
          const HeroImageView(),
          Container(
            margin: const EdgeInsets.only(left: Margins.small),
            alignment: Alignment.centerLeft,
            child: const HeroTextView(
              alignment: Alignment.centerLeft,
            ),
          ),
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
                BorderSizes.big,
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
  const HeroTextView({
    super.key,
    this.needMargin = false,
    this.alignment,
    this.margin,
  });

  final bool needMargin;
  final double? margin;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.center,
      margin: EdgeInsets.only(
        top: needMargin ? margin ?? Margins.heroHeaderExtraTop : 0,
      ),
      constraints: const BoxConstraints(
          // maxHeight: HeroHeaderGeometry.heroHeaderExtrasHeight,
          ),
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: HeroHeaderGeometry.heroHeaderExtrasWidth),
        child: FutureBuilder(
          future: GoogleFonts.pendingFonts(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        AppLocalizations.of(context)!.heroTitle,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontFamily: 'Butler',
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.heroExplanation,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontFamily: 'Aileron'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            child:
                                Text(AppLocalizations.of(context)!.priesSpace),
                          )
                        ],
                      ),
                    )
                  ],
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
