part of 'prayers_intention.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class PrayersIntentionRequestView extends StatelessWidget {
  const PrayersIntentionRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      constraints: const BoxConstraints(maxWidth: ScreenSizes.tablet),
      padding: const EdgeInsets.symmetric(
        vertical: Paddings.huge,
        horizontal: Paddings.big,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.shareYourPriers,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Paddings.big, bottom: Paddings.listSeparator),
              child: Text(
                AppLocalizations.of(context)!.proverb,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.priersInvitation,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            //name and First name
            TextFormField(
              decoration: InputDecoration(
                label: Text(AppLocalizations.of(context)!.nameAndFirstName),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Email*"),
              ),
              validator: (value) {
                if (!isValidEmail(value ?? "")) {
                  return AppLocalizations.of(context)!.invalidEmail;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("${AppLocalizations.of(context)!.priers}*"),
              ),
              validator: (value) {
                if (value == null || value == "") {
                  return AppLocalizations.of(context)!.cantBeEmpty;
                }
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // do something
                  }
                },
                child: Text("Soumettre mon intention"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
