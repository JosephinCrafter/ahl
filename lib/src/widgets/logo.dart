part of 'widgets.dart';

class AhlLogo extends StatelessWidget {
  const AhlLogo({
    super.key,
    this.size = const Size(96, 96),
    this.leading,
    this.title,
    this.separation,
    this.foregroundColor,
  });

  final Size size;
  final Widget? leading;
  final Widget? title;
  final Widget? separation;

  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: 'Butler',
            fontSize: 20,
            color: foregroundColor ??
                Theme.of(context).textTheme.headlineLarge!.color,
          ),
      child: Row(
        children: [
          leading ??
              Container(
                constraints: BoxConstraints.loose(size),
                child: Image.asset(
                  AhlAssets.logoForm,
                  fit: BoxFit.contain,
                ),
              ),
          separation ??
              const SizedBox(
                width: 30,
              ),
          title ??
              Text(
                "Ajourd'hui l'avenir",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontFamily: 'Butler',
                    ),
              ),
        ],
      ),
    );
  }
}

// Old logo setup
//
// Row(
        //   children: [
        //     SizedBox.fromSize(
        //       size: size,
        //       child: Image.asset(
        //         AhlAssets.logoForm,
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 30,
        //     ),
        //     Text(
        //       "Ajourd'hui l'avenir",
        //       style: Theme.of(context).textTheme.bodyLarge,
        //     ),
        //   ],
        // );