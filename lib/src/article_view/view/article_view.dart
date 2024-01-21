import 'package:ahl/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import "../data/data.dart";

class ArticleView extends StatelessWidget {
  const ArticleView({super.key, this.args});

  static const String routeName = '/articles';
  final dynamic args;

  final String articleTitle = 'leves_toi_et_marches';

  void callback() async {
    ArticleHelper helper = ArticleHelper();
    print(
      await helper.getArticleByName(articleTitle: articleTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _args = args ??
        ModalRoute.of(context)!.settings.arguments; // todo: as ArticleArgument

    return Scaffold(
      appBar: const AhlAppBar(),
      body: Center(
        child: Column(
          children: [
            Text('The navigation url is\n$_args'),
              ElevatedButton(
              onPressed: callback,
              child: const Text('Make cloud_firestore transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
