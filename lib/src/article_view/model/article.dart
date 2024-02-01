//todo: prevent adding id to prevent article conflict.

/// Attribute of an Article
const String titleKey = 'title';
const String releaseDateKey = 'releaseDate';
const String contentKey = 'content';
const String relationsKey = 'relations';

class Article {
  const Article({
    this.title,
    this.releaseDate, // The date of the edition of this code
    this.contentPath,
    this.relations,
  });

  /// Build an Article from doc.
  Article.fromDoc(Map<String, dynamic> doc) :
  title = doc[titleKey],
  releaseDate = doc[releaseDateKey],
  contentPath = doc[contentKey],
  relations = doc[relationsKey];

  /// Article title
  ///
  /// This variable should be the same as the article document name in
  /// cloud firestore. It is used to reference the article every where.
  final String? title;

  /// A string representing the release date of an article.
  ///
  /// Supported formatting is Fr,fr date format.
  /// ex: 19/01/2027
  final String? releaseDate;

  /// This is the Cloud Storage path that leads to the markdown file of the
  /// article.
  final String? contentPath;

  /// Related to the articles in a list of Maps.
  ///
  /// This can contains:
  /// - other articles
  /// - images
  /// - videos
  final List<Map<String, dynamic>>? relations;

  /// Create doc from an Article
  Map<String, dynamic> toDoc() =>
  {
    titleKey: title,
    contentKey: contentPath,
    releaseDateKey: releaseDate,
    relationsKey: relations,
  };

  @override
  String toString() => '''
{
  $titleKey : $title,
  $releaseDateKey: $releaseDate,
  $contentKey: $contentPath,
  $relationsKey: $relations,
}
''' ;
  
}
