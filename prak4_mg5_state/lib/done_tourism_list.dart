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
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  place.name,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Icon(Icons.done_outline),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            place.location,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
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
