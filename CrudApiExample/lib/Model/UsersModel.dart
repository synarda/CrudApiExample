class UserModel {
  final String id;
  String name;
  String image;
  DateTime  birthday;
  String horoscope;
  String horoscopeUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.birthday,
    required this.horoscope,
    required this.horoscopeUrl,
  });



  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    birthday: DateTime.parse(json["birthday"]),
    horoscope: json["horoscope"],
    horoscopeUrl: json["horoscopeUrle"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "birthday": birthday.toIso8601String(),
    "horoscope": horoscope,
    "horoscopeUrle": horoscopeUrl,
  };
}