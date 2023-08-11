import 'package:dio/dio.dart';

import '../models/user_model.dart';

class UserService{

  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> getUsers() async {
    List<UserModel> usersList = [];
    final response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      UserModel user = UserModel.fromJson(element);
      usersList.add(user);
    });
    return usersList;
  }
}