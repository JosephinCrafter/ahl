part of 'widgets.dart';

class AhlFooter extends StatelessWidget {
  const AhlFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.AppTheme.blueNight,
      padding: const EdgeInsets.symmetric(
          horizontal: Paddings.medium, vertical: Paddings.big),
      child: Column(
        children: [
          Image.asset(AhlAssets.logoFormTypoHorizontalColored),
        ],
      ),
    );
  }
}
