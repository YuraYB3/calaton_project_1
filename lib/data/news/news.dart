import '../../domain/news/inews.dart';

class News implements INews {
  @override
  String author;

  @override
  String title;

  @override
  String description;

  @override
  String imageUrl;

  News({
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
