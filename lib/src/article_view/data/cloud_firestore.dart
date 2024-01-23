part of 'data.dart';

/// Firestore instance to be used.

class ArticleHelper {
  ArticleHelper();

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
      await firestore.doc('$collection/$path').get();

  Article? buildArticleFromDoc(Map<String, dynamic> map) {
    return Article.fromDoc(map);
  }
}
