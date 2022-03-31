import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prak5_mg7_crud/page/detail_page.dart';
import 'package:prak5_mg7_crud/page/form_page.dart';
import 'package:prak5_mg7_crud/page/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Poppins'
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const HomePage(),
        '/tambah':(context) => const FormPage(),
        '/detail':(context) => DetailScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}