// Test the data storage mechanism and triggering from firestore.
import 'package:ahl/src/article_view/data/data.dart';
import 'package:ahl/src/article_view/model/article.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ahl/firebase_options.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:mockito/mockito.dart';

const emulatorHost = 'localhost';
const firestorePort = 46561;
const storagePort = 9199;
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseFirestore firestore;
  FirebaseStorage storage;

  // firestore = FirebaseFirestore.instance;
  firestore = FakeFirebaseFirestore();
  // firestore.useFirestoreEmulator(emulatorHost, firestorePort);

  // storage = FirebaseStorage.instance;
  storage = MockFirebaseStorage();
  // storage.useStorageEmulator(emulatorHost, storagePort);

  // setup fixtures
  String testCollectionName = 'test';
  // test document
  String docTest = 'DocTest';
  // test data
  Map<String, dynamic> testData = {'title': 'A test on firebase firestore'};

  /// a doc fixture
      Map<String, dynamic> doc = {
        'title': 'Leves toi et marches',
        'content': 'articles/leves_toi_et_marches/content.md',
        'releaseDate': '19/01/2024',
        'relations': [
          {
            'type': 'articles',
            'path': 'articles/carem/mercredi_des_cendres',
          },
        ],
      };
  group('Emulator operational verification', () {
    test('Write data to firestore', () async {
      await firestore
          .collection(testCollectionName)
          .doc(docTest)
          .set(testData, SetOptions(merge: true));

      await firestore.doc('$testCollectionName/$docTest').get();
    });
  });

  group(
    'Test on ArticleHelper class.',
    () {
      ArticleHelper articleHelper = MockArticleHelper();
      test(
        'test on class method. This test should fail.',
        () {
          Future<Article?> articleOfTheMonth =
              articleHelper.getArticleOfTheMonth();
          Future<Article?> namedArticle =
              articleHelper.getArticleByName(articleTitle: 'some_article_name');
        },
      );
      test('Get raw data from cloud firestore', () {
        ArticleHelper articleHelper = ArticleHelper();
        Future<Article?> namedArticle =
            articleHelper.getArticleByName(articleTitle: 'leves_toi_et_marche');
      });
    },
  );

  group(
    'test on Article class.',
    () {
      

      test(
        'Instantiate an article without argument',
        () {
          Article article = Article();

          var title = article.title;
          var releaseDate = article.releaseDate;
          var content = article.contentPath;
          var relations = article.relations;

          Article article1 = const Article(
            title: 'Title',
            releaseDate: '19/01/2024',
            contentPath: 'articles/some_content.md',
            relations: [
              {
                'type': 'image',
                'path': 'article/some_article/image.png',
              }
            ],
          );

          Article article2 = Article.fromDoc(doc);
          expect(article2.title == doc[titleKey], true);
          expect(article2.contentPath == doc[contentKey], true);
          expect(article2.relations == doc[relationsKey], true);
          expect(article2.releaseDate,  doc[releaseDateKey]);

          expect( article2.toDoc() , equals(doc));
        },
      );
    },
  );
}

class MockArticleHelper with Mock implements ArticleHelper {}
