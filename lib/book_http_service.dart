import 'package:http/http.dart';
import 'dart:convert';

class HttpService {
  HttpService() {}

  getAllBooks() async {
    // var url = Uri.parse('http://10.0.2.2:8000/book/getAllBooks');
    var url = Uri.parse('http://localhost:8000/book/getAllBooks');

    var response = await get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response;
    }
  }

  getBook(bookId) async {
    // var url = Uri.parse('http://10.0.2.2:8000/book/bookId');
    var url = Uri.parse('http://localhost:8000/book/$bookId');

    var response = await get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return response;
    }
  }
}
