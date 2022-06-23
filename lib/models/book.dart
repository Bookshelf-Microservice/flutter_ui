class Book {
  String? bookName;
  String? bookAuthor;
  String? bookPublishingHouse;
  String? bookUrl;

  Book(
      {this.bookName, this.bookAuthor, this.bookPublishingHouse, this.bookUrl});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookName: json['bookName'].toString(),
      bookAuthor: json['bookAuthor'].toString(),
      bookPublishingHouse: json['bookPublishingHouse'].toString(),
      bookUrl: json['bookUrl'].toString(),
    );
  }
}
