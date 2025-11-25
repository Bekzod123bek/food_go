class FoodModel {
  List<Resturant> resturants;

  FoodModel({required this.resturants});

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
    resturants: List<Resturant>.from(
      json["resturants"].map((x) => Resturant.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "resturants": List<dynamic>.from(resturants.map((x) => x.toJson())),
  };
}

class Resturant {
  String name;
  double rating;
  String image;
  String description;
  String location;
  String phoneNumber;
  List<Menu> menu;

  Resturant({
    required this.name,
    required this.rating,
    required this.image,
    required this.description,
    required this.location,
    required this.phoneNumber,
    required this.menu,
  });

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
    name: json["name"] ?? '',
    rating: json["rating"]?.toDouble() ?? 0.0,
    image: json["image"] ?? "",
    description: json["description"] ?? '',
    location: json["location"] ?? '',
    phoneNumber: json["phone_number"] ?? "",
    menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "rating": rating,
    "image": image,
    "description": description,
    "location": location,
    "phone_number": phoneNumber,
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
  };
}

class Menu {
  String name;
  String price;
  String image;

  Menu({required this.name, required this.price, required this.image});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    name: json["name"] ?? "",
    price: json["price"] ?? "",
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
  };
}
