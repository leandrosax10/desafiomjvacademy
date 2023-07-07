class CarModel {
  String? name;
  double? price;
  String? img;
  String? description;
  int? year;

  CarModel({
    required this.name,
    required this.price,
    required this.img,
    required this.description,
    this.year,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    img = json['img'];
    description = json['description'];
    year = json['year'];
  }
}
