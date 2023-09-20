// import 'dart:convert';
// 
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:starter_kit/models/pokemon.dart';
// import 'package:starter_kit/pages/pokemon/pokemon_detail.dart';
// 
// class PokemonPage extends StatefulWidget {
//   const PokemonPage({super.key});
// 
//   @override
//   PokemonPageState createState() {
//     return PokemonPageState();
//   }
// }
// 
// class PokemonPageState extends State<PokemonPage> {
//   var url = "https://raw.githubusercontent.com/Thepilli/my_starter/main/poke_source.json";
// 
//   late Pokehub pokehub;
// 
//   @override
//   void initState() {
//     pokehub = Pokehub();
//     super.initState();
// 
//     fetchData();
//   }
// 
//   fetchData() async {
//     var res = await http.get(Uri.parse(url));
//     var decodedJson = jsonDecode(res.body);
//     pokehub = Pokehub.fromJson(decodedJson);
//     setState(() {});
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Poke App"),
//         backgroundColor: Colors.cyan,
//       ),
//       body: pokehub == null
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : GridView.count(
//               crossAxisCount: 2,
//               children: pokehub.pokemon!
//                   .map((poke) => Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => PokeDetail(
//                                           pokemon: poke,
//                                         )));
//                           },
//                           child: Hero(
//                             tag: poke.img,
//                             child: Container(
//                               alignment: Alignment.center,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: <Widget>[
//                                   CachedNetworkImage(
//                                     imageUrl: poke.img,
//                                     height: 100,
//                                   ),
//                                   Text(
//                                     poke.name,
//                                     style: const TextStyle(
//                                       fontSize: 20.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ))
//                   .toList(),
//             ),
//       drawer: const Drawer(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.cyan,
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }
