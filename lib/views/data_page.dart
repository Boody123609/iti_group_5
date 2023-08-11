import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../service/user_service.dart';
class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<UserModel> users = [];
  bool isLoading = true;

  getMyUsers() async {
    users = await UserService().getUsers();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyUsers();
  }
  @override
  Widget build(BuildContext context) {
        return isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(users[index].id ?? "--"),
              subtitle: Text(users[index].title ?? "--"),
              trailing: Icon(Icons.person),
              leading: Text("${index + 1}"),
            );
          },
        );

  }
}
