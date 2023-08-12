import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import '../service/user_service.dart';
import 'cubit/users_cubit.dart';

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
    return
      BlocProvider(
        create: (context) => UsersCubit(),
        child: BlocConsumer<UsersCubit, UsersState>(
          builder: (context, state) {
            if (state is UsersLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UsersError) {
              return Center(
                child: Text("Error"),
              );
            }
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
            );;
          },
          listener: (context, state) {},
        ),
      );


  }
}
