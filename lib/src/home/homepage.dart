import 'package:ahl/src/ahl_barrel.dart';
import 'package:ahl/src/home/hero_header/hero_header.dart';
import 'package:ahl/src/home/welcoming/welcoming.dart';
import 'package:ahl/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Home page

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          endDrawer: constraints.maxWidth <= ScreenSizes.tablet
              ? const AhlDrawer()
              : null,
          appBar: const AhlAppBar(),
          // AppBar(
          //   title: const AhlLogo(),
          //   actions: [
          //     TabBar(
          //       tabs: [
          //         Tab(
          //           text: AppLocalizations.of(context)!.homeText,
          //         ),
          //         Tab(
          //           text: AppLocalizations.of(context)!.aboutUs,
          //         ),
          //         Tab(
          //           text: AppLocalizations.of(context)!.prayers,
          //         ),
          //         Tab(
          //           text: AppLocalizations.of(context)!.ourProjects,
          //         ),
          //         Tab(
          //           text: AppLocalizations.of(context)!.listening,
          //         ),
          //       ],
          //     )
          //   ],
          // ),

          // Here are placed all components that build the entire
          // HomePage
          body: ListView(
            children: [
              PromotionBar(
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Paddings.small),
                          child: Icon(
                            Icons.build_circle_rounded,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!
                            .inConstructionPromotionalMessage,
                      )
                    ],
                  ),
                ),
              ),
              const HeroHeaderView(),
              const WelcomingView(),
            ],
          ),
        );
      },
    );
  }
}

class PromotionBar extends StatefulWidget {
  const PromotionBar({
    super.key,
    required this.child,
    this.isShown = true,
    this.backgroundColor,
  });

  final Widget child;
  final Color? backgroundColor;
  final bool isShown;

  @override
  State<PromotionBar> createState() => _PromotionBarState();
}

class _PromotionBarState extends State<PromotionBar> {
  _PromotionBarState();

  late bool isShown;

  @override
  void initState() {
    super.initState();
    isShown = widget.isShown;
  }

  @override
  Widget build(BuildContext context) {
    return isShown
        ? Container(
            color: widget.backgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                widget.child,
                IconButton(
                  onPressed: close,
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  void close() => setState(() {
        isShown = false;
      });

  void open() {
    if (isShown == true) {
      return;
    } else {
      setState(() => isShown = true);
    }
  }
}
