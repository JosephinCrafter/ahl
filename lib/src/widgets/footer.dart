part of 'widgets.dart';

class AhlFooter extends StatelessWidget {
  const AhlFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.AhlTheme.blueNight,
      padding: const EdgeInsets.symmetric(
        horizontal: Paddings.medium,
        vertical: Paddings.big,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 57),
            child: Image.asset(AhlAssets.logoFormTypoHorizontalColoredDark),
          ),
          const DefaultTextStyle(
            style: TextStyle(
              fontFamily: 'Aileron',
            ),
            child: Wrap(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
