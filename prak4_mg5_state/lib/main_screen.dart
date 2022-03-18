import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prak4_mg5_state/detail_screen.dart';
import 'package:prak4_mg5_state/done_tourism_list.dart';
import 'package:prak4_mg5_state/model/tourism_place.dart';
import 'package:prak4_mg5_state/tourism_list.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<TourismPlace> doneTourismPlaceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Surabaya"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DoneTourismList(
                    doneTourismPlaceList: doneTourismPlaceList);
              }));
            },
          ),
        ],
      ),
      body: TourismList(doneTourismPlaceList: doneTourismPlaceList),
    );
  }
}
