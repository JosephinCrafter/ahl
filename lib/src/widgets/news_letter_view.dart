part of 'widgets.dart';

class NewsLetterPrompt extends StatefulWidget {
  const NewsLetterPrompt({super.key});

  @override
  State<NewsLetterPrompt> createState() => _NewsLetterPromptState();
}

class _NewsLetterPromptState extends State<NewsLetterPrompt> {
  final TextEditingController emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Paddings.huge),
      color: theme.AhlTheme.yellowRelax,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.invitingNewsLetter,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            AppLocalizations.of(context)!.newsLetterWidgetTitle,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Paddings.big,
            ),
            child: TextField(
              decoration: InputDecoration(
                label: const Text('e-mail'),
                hintText: AppLocalizations.of(context)!.exampleMail,
                border: const OutlineInputBorder(),
              ),
              controller: emailInputController,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              //todo: implement with firebase cloud messaging
            },
            child: Text(
              AppLocalizations.of(context)!.register,
            ),
          ),
        ],
      ),
    );
  }

  Axis evaluateAxis(BoxConstraints constraints) {
    Axis axis;

    if (constraints.maxWidth >= ScreenSizes.mobile) {
      axis = Axis.horizontal;
    } else {
      axis = Axis.vertical;
    }

    return axis;
  }
}
