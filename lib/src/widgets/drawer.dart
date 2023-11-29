part of 'widgets.dart';

class AhlDrawer extends StatelessWidget {
  const AhlDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Drawer(
        width: constraints.maxWidth,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          appBar: AhlAppBar(
            padding: const EdgeInsets.only(left: Paddings.drawerAppBarPadding),
            crossAxisAlignment: CrossAxisAlignment.center,
            title: AhlLogo(
              crossAxisAlignment: CrossAxisAlignment.center,
              leading: const Icon(
                Icons.home_filled,
                color: Colors.black54,
                size: IconSizes.medium,
              ),
              separation: Container(width: 9),
              title: Text(
                AppLocalizations.of(context)!.longAppTitle,
              ),
            ),
            ending: Hero(
              tag: 'menu_button_tag',
              child: IconButton(
                onPressed: () => Scaffold.of(context).closeEndDrawer(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          // body of the drawer
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: Sizes.menuButtonWidth,
                    maxHeight: Sizes.menuButtonListHeight,
                  ),
                  margin: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Paddings.small),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: Paddings.medium),
                            child: Text(
                              AppLocalizations.of(context)!.aboutUs,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: 'Aileron',
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Paddings.small),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: Paddings.medium),
                            child: Text(
                              AppLocalizations.of(context)!.prayers,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: 'Aileron',
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Paddings.small),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: Paddings.medium),
                            child: Text(
                              AppLocalizations.of(context)!.ourProjects,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: 'Aileron',
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Paddings.small),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: Paddings.medium),
                            child: Text(
                              AppLocalizations.of(context)!.news,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: 'Aileron',
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 64),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                          ),
                          child: Container(
                            padding: ButtonGeometry.elevatedButtonPaddings,
                            child: Text(
                                AppLocalizations.of(context)!.makeDonation),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: const BoxConstraints.expand(height: 50),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: theme.greenOlive),
                  child: Text(
                    'N.D.D MADAGASCAR 2023',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontFamily: 'Aileron',
                          fontWeight: FontWeight.w100,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
