import 'package:bookshelf_ui/models/book.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BookHttpService {
  Future<List<Book>?> getAllBooks() async {
    var url = Uri.parse('http://localhost:8000/book/getAllBooks');
    List<Book>? bookList;

    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      bookList = body.map((dynamic item) => Book.fromJson(item)).toList();
    }
    return bookList;
  }
}
