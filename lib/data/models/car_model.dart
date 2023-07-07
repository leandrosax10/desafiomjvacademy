
class CarModel {
  String? name;
  double? price;
  String? img;
  String? description;

  CarModel({
    required this.name,
    required this.price,
    required this.img,
    required this.description,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    img = json['img'];
    description = json['description'];
  }
}
