import 'dart:convert';
import 'package:http/http.dart' as http;

void quotes() async {
  String url = "https://type.fit/api/quotes";
  final response = await http.get(url);
  print(response.body);

  Quotes quotes = Quotes.fromJson(jsonDecode(response.body[0]));
  print(quotes.text);
}

class Quotes {
  String text;
  String author;

  Quotes({this.text, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['author'] = this.author;
    return data;
  }
}
