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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pour rester informer",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Abonnez-vous à la newsletter",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Paddings.big,
            ),
            child: TextField(
              decoration: const InputDecoration(
                label: Text('email'),
                hintText: 'yourname@example.com',
                border: OutlineInputBorder(),
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
            child: const Text(
              "S'inscrire",
            ),
          ),
        ],
      ),
    );
  }
}
