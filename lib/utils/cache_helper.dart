import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';

class CacheHelper {
  static Future<List<ListModel>> LoadDataFromListCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData = prefs.getStringList('Cache_List');
    if (jsonData != null) {
      List<ListModel> data = jsonData
          .map((jsonString) => ListModel.fromJson(json.decode(jsonString)))
          .toList();
      return data;
    } else {
      return [];
    }
  }

  static Future<List<commentModel>> LoadDataFromCommentCache(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonData = prefs.getStringList(key);
    if (jsonData != null) {
      List<commentModel> data = jsonData
          .map((jsonString) => commentModel.fromJson(json.decode(jsonString)))
          .toList();
      return data;
    } else {
      return [];
    }
  }

  static Future<void> CacheListData(List<ListModel> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        data.map((model) => json.encode(model.toJson())).toList();
    await prefs.setStringList('Cache_List', encodedData);
  }

  static Future<void> CacheCommentData(
      int post_id, List<commentModel> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> encodedData =
        data.map((model) => json.encode(model.toJson())).toList();
    await prefs.setStringList(post_id.toString(), encodedData);
  }
}
