part of 'widgets.dart';

class ActionsLists {
  ActionsLists._();

  static final List<Widget> actions = <Widget>[
    Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.small),
        child: TextButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: Paddings.medium),
            child: Text(
              AppLocalizations.of(context)!.aboutUs,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Aileron',
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    ),
    Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.small),
        child: TextButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: Paddings.medium),
            child: Text(
              AppLocalizations.of(context)!.prayers,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Aileron',
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    ),
    Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.small),
        child: TextButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: Paddings.medium),
            child: Text(
              AppLocalizations.of(context)!.ourProjects,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Aileron',
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    ),
    Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Paddings.small),
        child: TextButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: Paddings.medium),
            child: Text(
              AppLocalizations.of(context)!.news,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Aileron',
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ),
    ),
    Builder(
      builder: (context) => Container(
        margin: const EdgeInsets.only(top: 64),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: Container(
            padding: ButtonGeometry.elevatedButtonPaddings,
            child: Text(AppLocalizations.of(context)!.makeDonation),
          ),
        ),
      ),
    ),
  ];
}
