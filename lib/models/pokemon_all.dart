// To parse required this JSON data, do
//
//     final pokemonAll = pokemonAllFromJson(jsonString);

// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

List<PokemonAll> pokemonAllFromJson(String str) => List<PokemonAll>.from(json.decode(str).map((x) => PokemonAll.fromJson(x)));

String pokemonAllToJson(List<PokemonAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PokemonAll {
  String name;
  String id;
  String imageurl;
  String xdescription;
  String ydescription;
  String height;
  String category;
  String weight;
  List<String> typeofpokemon;
  List<String> weaknesses;
  List<String> evolutions;
  List<String> abilities;
  int hp;
  int attack;
  int defense;
  int specialAttack;
  int specialDefense;
  int speed;
  int total;
  String malePercentage;
  String femalePercentage;
  int genderless;
  String cycles;
  String eggGroups;
  String evolvedfrom;
  String reason;
  String baseExp;

  PokemonAll({
    required this.name,
    required this.id,
    required this.imageurl,
    required this.xdescription,
    required this.ydescription,
    required this.height,
    required this.category,
    required this.weight,
    required this.typeofpokemon,
    required this.weaknesses,
    required this.evolutions,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.total,
    required this.malePercentage,
    required this.femalePercentage,
    required this.genderless,
    required this.cycles,
    required this.eggGroups,
    required this.evolvedfrom,
    required this.reason,
    required this.baseExp,
  });

  factory PokemonAll.fromJson(Map<String, dynamic> json) => PokemonAll(
        name: json["name"] ?? '',
        id: json["id"] ?? '',
        imageurl: json["imageurl"] ?? '',
        xdescription: json["xdescription"] ?? '',
        ydescription: json["ydescription"] ?? '',
        height: json["height"] ?? '',
        category: json["category"] ?? '',
        weight: json["weight"] ?? '',
        typeofpokemon: json["typeofpokemon"] == null ? [] : List<String>.from(json["typeofpokemon"]!.map((x) => x)),
        weaknesses: json["weaknesses"] == null ? [] : List<String>.from(json["weaknesses"]!.map((x) => x)),
        evolutions: json["evolutions"] == null ? [] : List<String>.from(json["evolutions"]!.map((x) => x)),
        abilities: json["abilities"] == null ? [] : List<String>.from(json["abilities"]!.map((x) => x)),
        hp: json["hp"] ?? '',
        attack: json["attack"] ?? '',
        defense: json["defense"] ?? '',
        specialAttack: json["special_attack"] ?? '',
        specialDefense: json["special_defense"] ?? '',
        speed: json["speed"] ?? '',
        total: json["total"] ?? '',
        malePercentage: json["male_percentage"] ?? '',
        femalePercentage: json["female_percentage"] ?? '',
        genderless: json["genderless"] ?? '',
        cycles: json["cycles"] ?? '',
        eggGroups: json["egg_groups"] ?? '',
        evolvedfrom: json["evolvedfrom"] ?? '',
        reason: json["reason"] ?? '',
        baseExp: json["base_exp"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "imageurl": imageurl,
        "xdescription": xdescription,
        "ydescription": ydescription,
        "height": height,
        "category": category,
        "weight": weight,
        "typeofpokemon": typeofpokemon == null ? [] : List<dynamic>.from(typeofpokemon.map((x) => x)),
        "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses.map((x) => x)),
        "evolutions": evolutions == null ? [] : List<dynamic>.from(evolutions.map((x) => x)),
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities.map((x) => x)),
        "hp": hp,
        "attack": attack,
        "defense": defense,
        "special_attack": specialAttack,
        "special_defense": specialDefense,
        "speed": speed,
        "total": total,
        "male_percentage": malePercentage,
        "female_percentage": femalePercentage,
        "genderless": genderless,
        "cycles": cycles,
        "egg_groups": eggGroups,
        "evolvedfrom": evolvedfrom,
        "reason": reason,
        "base_exp": baseExp,
      };
}
