class NewsModel {
  final int id;
  final String title;
  final String content;
  final String image;
  final int cid;
  final String categoryTitle;

  NewsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.cid,
    required this.categoryTitle,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      cid: json['cid'],
      categoryTitle: json['category_title'],
    );
  }

  @override
  String toString() {
    return id.toString();
  }
}
