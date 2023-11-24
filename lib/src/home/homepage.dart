import 'package:ahl/src/ahl_barrel.dart';
import 'package:ahl/src/home/hero_header/hero_header.dart';
import 'package:ahl/src/widgets/logo.dart';
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
          drawer: constraints.maxWidth <= ScreenSizes.mobile
              ? const Drawer()
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
            children: const [
              HeroHeaderView(),
            ],
          ),
        );
      },
    );
  }
}

/// class for the appBar
class AhlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AhlAppBar({
    super.key,
    Size? preferredSize,
    this.title = const AhlLogo(),
    this.backgroundColor,
  }) : _preferredSize = preferredSize ??
            const Size.fromHeight(
              Sizes.appBarSize,
            );

  /// The preferred size of this widget
  final Size _preferredSize;
  final Widget title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case <= ScreenSizes.mobile:
            // use the mobile appBar
            return Container(
              constraints: BoxConstraints.loose(
                _preferredSize,
              ),
              color: backgroundColor ??
                  Theme.of(context).colorScheme.secondaryContainer,
              padding: const EdgeInsets.all(
                Paddings.medium,
              ),
              child: Row(
                children: [
                  title,
                ],
              ),
            );
          default:
            // Use the default web appBar
            return Container(
              constraints: BoxConstraints.loose(
                _preferredSize,
              ),
            );
        }
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => _preferredSize;
}
