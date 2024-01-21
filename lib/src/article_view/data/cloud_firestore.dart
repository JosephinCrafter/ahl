part of 'data.dart';

/// Firestore instance to be used.
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

const String emulatorHost = 'localhost';
const int firestorePort = 46561;

class ArticleHelper {
  ArticleHelper() {
    if (kDebugMode) {
      _firestore.useFirestoreEmulator(emulatorHost, firestorePort);
    }
  }

  /// The name of the collection containing articles.
  static const String collection = 'articles';

  /// Return a fully formed article given it's articleTitle
  Future<Article?> getArticleByName({required String articleTitle}) async {
    DocumentSnapshot<Map<String, dynamic>> result =
        await getRawDoc(articleTitle);
    Map<String, dynamic>? map = result.data();
    if (map == null) {
      return null;
    }
    return buildArticleFromDoc(map);
  }

  Future<Article?> getArticleOfTheMonth() async {
    throw UnimplementedError();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getRawDoc(String path) async =>
      await _firestore.doc('$collection/$path').get();

  Article? buildArticleFromDoc(Map<String, dynamic> map) {
    return Article.fromDoc(map);
  }
}
