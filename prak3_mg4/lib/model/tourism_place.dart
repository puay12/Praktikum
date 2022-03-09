class TourismPlace {
  String name;
  String location;
  String imageAsset;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imageAsset,
  });
}

var tourismPlaceList = [
  TourismPlace(
    name: "Surabaya Submarine Monument", 
    location: "Jl. Pemuda", 
    imageAsset: "asset/img/submarine.jpg",
  ),
];
