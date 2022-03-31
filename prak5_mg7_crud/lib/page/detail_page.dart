import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail';
  DetailScreen({Key? key}) : super(key: key);

  final CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('collection');
  
  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(place['img']),
              Container(
                margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
                child: Text(
                  place['nama'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
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
                      children: <Widget> [
                        Icon(Icons.alarm_on_outlined),
                        Text(
                          place['jam_operasional'],
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget> [
                        Icon(Icons.payment_outlined),
                        Text("Rp $place['harga_tiket']",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12.0,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purpleAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                margin: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 32.0, right: 32),
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  place['desc'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
      )  
    ); 
  }
}