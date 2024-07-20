import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com',
  connectTimeout: Duration(seconds: 10),
  receiveTimeout: Duration(seconds: 10),
);
final dio = Dio(options);

Future<dynamic> postRequest(String? endpoint, Map<String, dynamic> data) async {
  var postResult = await dio.post(endpoint!, data: data);
  return postResult;
}

Future<dynamic> getRequest(String? endpoint) async {
  var getResult = await dio.get(endpoint!);
  if (getResult.statusCode == 200) {
    return getResult.data;
  } else {
    return 'something wrong while fetching data';
  }
}
