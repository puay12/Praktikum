import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prak4_mg5_state/detail_screen.dart';
import 'package:prak4_mg5_state/list_item.dart';
import 'package:prak4_mg5_state/model/tourism_place.dart';
import 'package:prak4_mg5_state/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

class TourismList extends StatefulWidget {
  const TourismList({Key? key}) : super(key: key);

  @override
  State<TourismList> createState() => _TourismListState();
}

class _TourismListState extends State<TourismList> {
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: "Surabaya North Quay",
      location: "Terminal Gapura Surya Nusantara",
      imageAsset: "asset/img/northquay.jpg",
      desc:
          "Surabaya North Quay is actually a terminal for luxury cruise ships that dock. However, this place is deliberately addressed so that it can become a tourist spot for residents of Surabaya and its surroundings. In fact, not a few who come from outside the area are curious to enjoy the amazing scenery. The high seas with luxury cruise ships that dock in this terminal, are the main attraction.",
      dayopen: "Tue - Sun",
      timeopen: "12:00 - 20:00",
      price: "Rp 50.000,00",
      galery: [
        "asset/img/northquay/n1.jpg",
        "asset/img/northquay/n2.jpg",
        "asset/img/northquay/n3.jpg",
        "asset/img/northquay/n4.jpg"
      ],
    ),
    TourismPlace(
      name: "Jembatan Kenjeran Surabaya",
      location: "Kenjeran",
      imageAsset: "asset/img/kenjeran.jpg",
      desc:
          "Suroboyo Bridge or commonly known as Kenjeran Bridge is a through arch bridge across the coastal area of Eastern Surabaya in Kenjeran Beach, District Kenjeran, Surabaya, East Java, Indonesia. This bridge has a length of 800 meters with a width of 18 meters and a height of 12 meters which is held with 150 stakes. The design of the bridge is built in a circle with a view of the fountain in the center of bridge.",
      dayopen: "Mon - Sat",
      timeopen: "10:00 - 20:00",
      price: "Free",
      galery: [
        "asset/img/kenjeran/k1.jpg",
        "asset/img/kenjeran/k2.jpg",
        "asset/img/kenjeran/k3.jpg",
        "asset/img/kenjeran/k4.jpg"
      ],
    ),
    TourismPlace(
      name: "Monumen Jalesveva Jayamahe",
      location: "Armada Timur TNI Angkatan Laut",
      imageAsset: "asset/img/jayamahe.jpg",
      desc:
          "Jalesveva Jayamahe Monument or can be locally referred to as Monjaya is a statue of an Indonesian Navy officer wearing Ceremonial Service Dress, complete with his sword of honor, staring far to the sea as if he's ready to challenge the ocean's tide and storms. It represents the preparedness of the Indonesian Navy for glory. The statue is standing tall above a building, the total height of the building and the statue reaches 60.6 meters (approximately 198 feet and 9 inches).",
      dayopen: "Mon - Sat",
      timeopen: "10:00 - 20:00",
      price: "Rp 20.000,00",
      galery: [
        "asset/img/jayamahe/j1.jpg",
        "asset/img/jayamahe/j2.jpg",
        "asset/img/jayamahe/j3.jpg",
        "asset/img/jayamahe/j4.jpg"
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return SingleChildScrollView(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Consumer<DoneTourismProvider>(
              builder: (context, DoneTourismProvider data, widget) {
                return ListItem(
                  place: place,
                  isDone: doneTourismPlaceList.contains(place),
                  onCheckboxClick: (bool? value) {
                    setState(() {
                      if (value != null) {
                        value
                            ? doneTourismPlaceList.add(place)
                            : doneTourismPlaceList.remove(place);
                      }
                    });
                  },
                );
              },
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}
