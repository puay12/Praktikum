import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prak3_mg4/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wisata Bandung")),
      body: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen();
            }));
          },
          child: listItem(),
        ),
      ),
    );
  }

  Widget listItem() {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Image.asset('asset/img/submarine.jpg'),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text(
                    "Farm House Lembang",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Lembang"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
