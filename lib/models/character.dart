class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  String originName;
  String lastLocation;

  Character(this.id, this.name, this.status, this.species, this.gender, this.image,
      this.originName, this.lastLocation);

  Character.map(dynamic object) {
    this.id = object["id"];
    this.name = object["name"];
    this.status = object["status"];
    this.species = object["species"];
    this.gender = object["gender"];
    this.image = object["image"];
    this.originName = object["origin"]["name"];
    this.lastLocation = object["location"]["name"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["status"] = status;
    map["species"] = species;
    map["gender"] = gender;
    map["image"] = image;
    map["origin"]["name"] = originName;
    map["location"]["name"] = lastLocation;

    return map;
  }
}