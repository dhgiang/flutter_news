import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:news/src/models/item_model.dart';
import 'respository.dart';

class NewsApiProvider implements Source {
  Client client = Client();
  final String _root = 'https://hacker-news.firebaseio.com/v0';

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/topstories.json');
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
