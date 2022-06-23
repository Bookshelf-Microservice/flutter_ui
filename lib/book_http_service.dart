import 'package:bookshelf_ui/models/book.dart';
import 'package:http/http.dart';
import 'dart:convert';

class BookHttpService {
  Future<List<Book>?> getAllBooks() async {
    //var url = Uri.parse('http://10.0.2.2:8000/book/getAllBooks');
    var url = Uri.parse('http://localhost:8000/book/getAllBooks');
    List<Book>? bookList;
    print('içerdema');
    //var url = Uri.parse('http://localhost:9001/books/getAllBooks');
    //var url = Uri.parse('http://10.0.2.2:9001/books/getAllBooks');

    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      bookList = body.map((dynamic item) => Book.fromJson(item)).toList();
    }
    return bookList;
  }

  getBook(bookName) async {
    // var url = Uri.parse('http://10.0.2.2:8000/book/bookId');
    var url = Uri.parse('http://localhost:8000/book/$bookName');

    var response = await get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response;
    }
  }
}
