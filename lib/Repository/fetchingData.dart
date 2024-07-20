import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';
import 'package:tecapp/Repository/dioConfig.dart';

Future<List<ListModel>> getAllList() async {
  var result = await getRequest('/posts');

  if (result != null && result is List) {
    List<ListModel> listModelObjList =
        result.map((item) => ListModel.fromJson(item)).toList();
    print(listModelObjList);
    return listModelObjList;
  } else {
    return [];
  }
}

Future<List<commentModel>> getAllComments(int post_id) async {
  print(post_id);
  var result = await getRequest('/posts/${post_id}/comments');
  if (result != null && result is List) {
    List<commentModel> commentModelObjList =
        result.map((item) => commentModel.fromJson(item)).toList();
    print('********************************');
    print(commentModelObjList);
    print('********************************');

    return commentModelObjList;
  } else {
    return [];
  }
}

void postComments(int post_id, Map<String, dynamic> data) async {
  var response = await postRequest('/post/${post_id}/comments', data);
  print('response is ${response}');
}
