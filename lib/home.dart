import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
    String email;
   HomePage({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email ="";
  getCashEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('email');
    setState(() {

    });

  }
  @override
  void initState() {
    super.initState();
    getCashEmail();
  }
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),

            ),
          ),
          body: Center(child: Text(widget.email)),

        );

  }
}
