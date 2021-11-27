import 'package:flutter/material.dart';
import 'package:pdp_task_6_2_2/pages/logIn_page.dart';
import 'package:pdp_task_6_2_2/pages/signUp_page.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn_Widget(),
      routes: {
        SignUpPage().id : (context) => SignUpPage(),
        LogIn_Widget().id : (context) => LogIn_Widget(),
      },
    );
  }
}

