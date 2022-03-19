import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prak4_mg5_state/model/tourism_place.dart';
import 'package:prak4_mg5_state/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class DoneTourismList extends StatelessWidget {
  const DoneTourismList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TourismPlace> doneTourismPlaceList =
        Provider.of<DoneTourismProvider>(
          context,
          listen: false,
        ).doneTourismPlaceList;
        
    return Scaffold(
      appBar: AppBar(title: const Text("Wisata Telah Dikunjungi")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = doneTourismPlaceList[index];
          return SingleChildScrollView(
            child: Card(
              color: Colors.white60,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    place.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const Icon(Icons.done_outline),
                  // Checkbox(value: isDone, onChanged: )
                ],
              ),
            ),
          );
        },
        itemCount: doneTourismPlaceList.length,
      ),
    );
  }
}
