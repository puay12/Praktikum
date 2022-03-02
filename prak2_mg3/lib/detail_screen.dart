import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset('asset/img/submarine.jpg'),
          Container(
            margin: EdgeInsets.only(top: 72.0, bottom: 16.0),
            child: Text(
              "Surabaya Submarine Monument",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Icon(Icons.calendar_today),
                    Text("Open Everyday",
                        style: TextStyle(
                          color: Colors.black45,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            margin: const EdgeInsets.all(32.0),
            padding: const EdgeInsets.all(24.0),
            child: const Text(
              "Museum inside a decommissioned Russian war submarine with tours & an adjacent park with cafes. Clean and well maintained. Car park costs 10k, entrance fee 15k/person. You can see KRI Pasopati there. It is a Russian whiskey class. You can also watch the video about the Indonesian Navy at the building beside the submarine.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    ));
  }
}