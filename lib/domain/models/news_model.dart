class NewsModel {
  const NewsModel({
    required this.title,
    required this.link,
    this.date,
  });

  final String title;
  final String link;
  final DateTime? date;

  @override
  String toString() {
    return 'NewsModel(title: $title, link: $link, date: $date)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModel &&
          runtimeType == other.runtimeType &&
          link == other.link;

  @override
  int get hashCode => link.hashCode;
}