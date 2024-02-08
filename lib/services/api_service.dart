// api_services.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  http.MultipartRequest requestSendData = http.MultipartRequest(
      'POST', Uri.parse('http://localhost:8000/api/books'));

  static Future<List<Map<String, dynamic>>> fetchBooks() async {
    try {
      final Uri apiUrl =
          Uri.parse('http://localhost:8000/api/books');

      final http.Client client = http.Client();
      final response = await client.get(apiUrl);

      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(response.body);

        if (jsonData is Map<String, dynamic> && jsonData.containsKey('books')) {
          final List<Map<String, dynamic>> cars =
              List<Map<String, dynamic>>.from(jsonData['books']);
          return cars;
        } else if (jsonData is List) {
          return List<Map<String, dynamic>>.from(jsonData);
        } else {
          print('Unexpected data structure in API response');
          return [];
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response data: ${response.body}');
        return [];
      }
    } catch (error) {
      print('Error connecting to the API: $error');
      return [];
    }
  }

  dynamic createBook(
      String title, String author, String isbnNumber, String userName) async {
    try {
      requestSendData.fields['title'] = title;
      requestSendData.fields['author'] = author;
      requestSendData.fields['isbnNumber'] = isbnNumber;
      requestSendData.fields['userName'] = userName;

      final response = await requestSendData.send();
      String result = await response.stream.bytesToString();

      requestSendData.fields['header'] = 'application/json';

      if (response.statusCode == 200) {
        final dynamic jsonData = jsonDecode(result);

        if (jsonData is Map<String, dynamic> && jsonData.containsKey('book')) {
          final Map<String, dynamic> createdBook = jsonData['book'];

          print('Book successfully created: $createdBook');
        } else {
          print('Unexpected data structure in create book response');
        }
      } else {
        print('Create book request failed with status: ${response.statusCode}');
        print('Response data: $result');
      }
    } catch (error) {
      print('Error creating book: $error');
    } finally {
      requestSendData.headers.remove('Accept');
      requestSendData = http.MultipartRequest('POST',
          Uri.parse('http://macbook-pro-van-jesse-2.local:8000/api/books'));
    }
  }

  static updateBookUserName(int bookId, String userName) async {
    try {
      final Uri url = Uri.parse(
          'http://macbook-pro-van-jesse-2.local:8000/api/books/$bookId');

      final response = await http.put(
        url,
        body: {'userName': userName},
      );
      print(url);
      print(response.body);
    } catch (error) {
      print('$error');
    }
  }
}
