abstract interface class INews {
  String author;
  String title;
  String description;
  String imageUrl;

  INews(
      {required this.author,
      required this.title,
      required this.description,
      required this.imageUrl});
}
