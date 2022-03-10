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
  TourismPlace(
    name: "Klenteng Sanggar Agung", 
    location: "Kenjeran", 
    imageAsset: "asset/img/klenteng.jpg",
  ),
  TourismPlace(
    name: "House of Sampoerna", 
    location: "Krembangan Utara", 
    imageAsset: "asset/img/sampoerna.jpeg",
  ),
  TourismPlace(
    name: "Tugu Pahlawan", 
    location: "Alun-alun contong", 
    imageAsset: "asset/img/pahlawan.jpg",
  ),
  TourismPlace(
    name: "Patung Suro Boyo", 
    location: "Wonokromo", 
    imageAsset: "asset/img/patungsby.jpg",
  ),
  TourismPlace(
    name: "Jembatan Suramadu", 
    location: "Perbatasan Surabaya-Madura", 
    imageAsset: "asset/img/suramadu.jpg",
  ),
  TourismPlace(
    name: "Surabaya North Quay", 
    location: "Terminal Gapura Surya Nusantara", 
    imageAsset: "asset/img/northquay.jpg",
  ),
  TourismPlace(
    name: "Jembatan Kenjeran Surabaya", 
    location: "Kenjeran", 
    imageAsset: "asset/img/kenjeran.jpg",
  ),
  TourismPlace(
    name: "Monumen Jalesveva Jayamahe", 
    location: "Armada Timur TNI Angkatan Laut", 
    imageAsset: "asset/img/jayamahe.jpg",
  ),
];
