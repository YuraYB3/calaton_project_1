import 'package:project_1/domain/news/inews.dart';

class NewsModel implements INews {
  @override
  String author;

  @override
  String title;

  @override
  String description;

  @override
  String imageUrl;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
