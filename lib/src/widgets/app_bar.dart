part of 'widgets.dart';

/// class for the appBar
class AhlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AhlAppBar({
    super.key,
    Size? preferredSize,
    this.title = const AhlLogo(
      separation: SizedBox.shrink(),
    ),
    this.backgroundColor,
    this.actions = const [],
    this.ending,
    this.crossAxisAlignment,
    this.padding,
  }) : _preferredSize = preferredSize ??
            const Size.fromHeight(
              Sizes.appBarSize,
            );

  /// The preferred size of this widget
  final Size _preferredSize;
  final Widget title;
  final List<Widget> actions;
  final Widget? ending;
  final Color? backgroundColor;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    ScaffoldState scaffoldState = Scaffold.of(context);

    bool scaffoldHasDrawer = scaffoldState.hasEndDrawer;

    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case <= ScreenSizes.tablet:
            // use the mobile appBar
            return Container(
              constraints: BoxConstraints.tight(
                _preferredSize,
              ),
              color: backgroundColor ??
                  Theme.of(context).colorScheme.secondaryContainer,
              padding: padding ??
                  const EdgeInsets.all(
                    Paddings.appBarPadding,
                  ),
              child: Row(
                textBaseline: (crossAxisAlignment != null)
                    ? (crossAxisAlignment == CrossAxisAlignment.baseline)
                        ? TextBaseline.ideographic
                        : null
                    : TextBaseline.alphabetic,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title,
                  ...actions,
                  ending ?? const AhlMenuButton(),
                ],
              ),
            );
          default:
            // Use the default web appBar
            return Container(
              constraints: BoxConstraints.loose(
                _preferredSize,
              ),
              color: backgroundColor ??
                  Theme.of(context).colorScheme.secondaryContainer,
              padding: padding ??
                  const EdgeInsets.all(
                    Paddings.medium,
                  ),
              child: Row(
                textBaseline: (crossAxisAlignment != null)
                    ? (crossAxisAlignment == CrossAxisAlignment.baseline)
                        ? TextBaseline.ideographic
                        : null
                    : TextBaseline.ideographic,
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title,
                  ...actions,
                ],
              ),
            );
        }
      },
    );
  }

  @override
  Size get preferredSize => _preferredSize;
}

class AhlMenuButton extends StatelessWidget {
  const AhlMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    ScaffoldState scaffoldState = Scaffold.of(context);
    bool scaffoldHasEndDrawer = scaffoldState.hasEndDrawer;
    if (scaffoldHasEndDrawer) {
      return Hero(
        tag: 'menu_button_tag',
        child: IconButton(
          onPressed: () => scaffoldState.openEndDrawer(),
          icon: const Icon(
            Icons.menu,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
