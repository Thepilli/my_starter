// // To parse this JSON data, do
// //
// //     final pokemon = pokemonFromJson(jsonString);
// 
// import 'dart:convert';
// 
// Pokehub pokemonFromJson(String str) => Pokehub.fromJson(json.decode(str));
// 
// String pokemonToJson(Pokehub data) => json.encode(data.toJson());
// 
// class Pokehub {
//   List<Pokemon>? pokemon;
// 
//   Pokehub({
//     this.pokemon,
//   });
// 
//   factory Pokehub.fromJson(Map<String, dynamic> json) => Pokehub(
//         pokemon: json["pokemon"] == null ? [] : List<Pokemon>.from(json["pokemon"]!.map((x) => Pokemon.fromJson(x))),
//       );
// 
//   Map<String, dynamic> toJson() => {
//         "pokemon": pokemon == null ? [] : List<dynamic>.from(pokemon!.map((x) => x.toJson())),
//       };
// }
// 
// class Pokemon {
//   final int id;
//   final String num;
//   final String name;
//   final String img;
//   final List<String> type;
//   final String height;
//   final String weight;
//   final String candy;
//   final int candyCount;
//   final String egg;
//   final double spawnChance;
//   final double avgSpawns;
//   final String spawnTime;
//   final List<double> multipliers;
//   final List<String> weaknesses;
//   final List<Evolution> nextEvolution;
//   final List<Evolution> prevEvolution;
// 
//   Pokemon({
//     required this.id,
//     required this.num,
//     required this.name,
//     required this.img,
//     required this.type,
//     required this.height,
//     required this.weight,
//     required this.candy,
//     required this.candyCount,
//     required this.egg,
//     required this.spawnChance,
//     required this.avgSpawns,
//     required this.spawnTime,
//     required this.multipliers,
//     required this.weaknesses,
//     required this.nextEvolution,
//     required this.prevEvolution,
//   });
// 
//   factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
//         id: json["id"] ?? '',
//         num: json["num"] ?? '',
//         name: json["name"] ?? '',
//         img: json["img"] ?? '',
//         type: json["type"] == null ? [] : List<String>.from(json["type"]!.map((x) => x)),
//         height: json["height"] ?? '',
//         weight: json["weight"] ?? '',
//         candy: json["candy"] ?? '',
//         candyCount: json["candy_count"] ?? 0,
//         egg: json["egg"] ?? '',
//         spawnChance: json["spawn_chance"]?.toDouble() ?? 0,
//         avgSpawns: json["avg_spawns"]?.toDouble() ?? 0,
//         spawnTime: json["spawn_time"] ?? '',
//         multipliers: json["multipliers"] == null ? [] : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
//         weaknesses: json["weaknesses"] == null ? [] : List<String>.from(json["weaknesses"]!.map((x) => x)),
//         nextEvolution:
//             json["next_evolution"] == null ? [] : List<Evolution>.from(json["next_evolution"]!.map((x) => Evolution.fromJson(x))),
//         prevEvolution:
//             json["prev_evolution"] == null ? [] : List<Evolution>.from(json["prev_evolution"]!.map((x) => Evolution.fromJson(x))),
//       );
// 
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "num": num,
//         "name": name,
//         "img": img,
//         "type": type == null ? [] : List<dynamic>.from(type.map((x) => x)),
//         "height": height,
//         "weight": weight,
//         "candy": candy,
//         "candy_count": candyCount,
//         "egg": egg,
//         "spawn_chance": spawnChance,
//         "avg_spawns": avgSpawns,
//         "spawn_time": spawnTime,
//         "multipliers": multipliers == null ? [] : List<dynamic>.from(multipliers.map((x) => x)),
//         "weaknesses": weaknesses == null ? [] : List<dynamic>.from(weaknesses.map((x) => x)),
//         "next_evolution": nextEvolution == null ? [] : List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
//         "prev_evolution": prevEvolution == null ? [] : List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
//       };
// }
// 
// class Evolution {
//   final String num;
//   final String name;
// 
//   Evolution({
//     required this.num,
//     required this.name,
//   });
// 
//   factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
//         num: json["num"] ?? '',
//         name: json["name"] ?? '',
//       );
// 
//   Map<String, dynamic> toJson() => {
//         "num": num,
//         "name": name,
//       };
// }
