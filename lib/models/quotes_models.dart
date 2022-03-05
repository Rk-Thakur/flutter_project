class Quotes {
  late String categoty;
  late String author;
  late String text;
  Quotes({
    required this.categoty,
    required this.author,
    required this.text,
  });

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(
      categoty: json['category'] ?? 'Not Available',
      author: json['author'] ?? 'Not Available',
      text: json['text'] ?? 'Not Available',
    );
  }
}
