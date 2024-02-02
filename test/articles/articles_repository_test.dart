// Test on ArticleRepository class
// - Responsibility:
//   - provide article objects to the whole app
//     -  getArticleOfTheMonth()
//           ""get the highlight article of the month.
//
//              First, it read setup document in articles collection.
//              Then, gather the highlighted article from setup and display it.
//              ""
//     -  getArticleByName()
//     -  foldArticles(number)
//     -  AllArticles()
//     -  setUp()
//
// Because, this class interact directly to the backend api. It's function
// should return Future objects.

import 'package:ahl/src/article_view/data/data.dart';
import 'package:ahl/src/article_view/model/article.dart';
import 'package:ahl/src/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// A matcher of a null article.
const Article noArticle = Article(
  id: 'no_article',
);

class MockArticlesRepository extends Mock implements ArticlesRepository {}

void main() {
  FirebaseFirestore fakeFirestore = FakeFirebaseFirestore();
  ArticlesRepository repo =
      ArticlesRepository(firestoreInstance: fakeFirestore);
  setUp(() {
    var whoWeAreArticle = 'who_we_are';
    // populate the data
    var whoWeAreMap = {
      idKey: 'who_we_are',
      titleKey: 'Who we are',
      contentKey: 'some content'
    };
    fakeFirestore
        .collection(articlesCollection)
        .doc(whoWeAreArticle)
        .set(whoWeAreMap);

    // create a setup
    var setupDoc = 'setup';
    var setup = {
      RepoSetUp.highLight: 'who_we_are',
    };
    fakeFirestore.collection(articlesCollection).doc(setupDoc).set(setup);
  });
  test('each function of ArticlesRepository return Future<Article?>', () async {
    Article? highLight = await repo.getArticleOfTheMonth();

    expect(highLight, isNotNull);
    expect(highLight!.title, 'Who we are');
  });
  test('getArticleOfTheMonth on ArticlesRepository', () async {
    Article? articleOfTheMonth;

    await repo
        .getArticleOfTheMonth()
        .then((value) => articleOfTheMonth = value);

    expect(articleOfTheMonth, isNotNull);
  });
}
