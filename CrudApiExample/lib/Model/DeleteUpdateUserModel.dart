class DeleteUpdateUserModel {
  String name;
  String image;
  DateTime birthday;
  String horoscope;
  String horoscopeUrl;

  DeleteUpdateUserModel({
    required this.name,
    required this.image,
    required this.birthday,
    required this.horoscope,
    required this.horoscopeUrl,
  });


  factory DeleteUpdateUserModel.fromJson(Map<String, dynamic> json) => DeleteUpdateUserModel(
    name: json["name"],
    image: json["image"],
    birthday: DateTime.parse(json["birthday"]),
    horoscope: json["horoscope"],
    horoscopeUrl: json["horoscopeUrle"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "birthday": birthday.toIso8601String(),
    "horoscope": horoscope,
    "horoscopeUrle": horoscopeUrl,
  };


}