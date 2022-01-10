import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:starwarsbitsports/models/doc.dart';

class Repository {
  Future<List<Doc>> getBooksAuthor() async {

    String nameauthor = 'Kiyosaki';
    final url =
        'https://openlibrary-org.translate.goog/search.json?author=$nameauthor&page=1';
    final response = await http.get(
      Uri.parse(url),
 
    );
    final List<dynamic> decodeData = json.decode(response.body)['docs'];

    final collectionbooks = decodeData
        .map(
          (d) => Doc.fromJson(d),
        )
        .toList();

    return collectionbooks;
  }
}
