import 'package:bookshelf_ui/book_http_service.dart';
import 'package:bookshelf_ui/models/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPage extends StatelessWidget {
  final BookHttpService _bookHttpService = BookHttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Book>?>(
            future: _bookHttpService.getAllBooks(),
            builder: (BuildContext buildContext,
                AsyncSnapshot<List<Book>?> asyncSnapshot) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (asyncSnapshot.hasData != null) {
                    Book book = asyncSnapshot.data![index];
                    return MyCustomListTile(
                      book: book,
                    );
                  } else if (asyncSnapshot.hasError) {
                    return Center(
                      child: Text(
                        asyncSnapshot.error.toString(),
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                itemCount:
                    asyncSnapshot.data == null ? 0 : asyncSnapshot.data!.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

class MyCustomListTile extends StatelessWidget {
  Book book;
  MyCustomListTile({required this.book});
  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        if (book.bookUrl != null) {
          _launchURL(book.bookUrl ?? 'null');
        }
      }),
      child: Card(
        child: Column(
          children: [
            Text(book.bookName == null
                ? 'No Book Name'
                : book.bookName!.toUpperCase()),
            Text(book.bookAuthor ?? 'No Author'),
            Text(book.bookPublishingHouse ?? 'No Publisher')
          ],
        ),
      ),
    );
  }
}
