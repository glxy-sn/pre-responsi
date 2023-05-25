import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:lat_responsi/weapon/detail_weapon.dart';
import 'package:lat_responsi/weapon/selected_weapon.dart';


// class ListWeapon extends StatefulWidget {
//   const ListWeapon({Key? key}) : super(key: key);
//
//   @override
//   State<ListWeapon> createState() => _ListWeaponState();
// }
//
// class _ListWeaponState extends State<ListWeapon> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildListWeapon(),
//     );
//   }
// }
//
// Widget _buildListWeapon() {
//   return Container(
//     padding: const EdgeInsets.all(9.0),
//     child: FutureBuilder<List<dynamic>>(
//       future: ApiDataSource.instance.loadWeapon(),
//       builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
//         if (snapshot.hasError) {
//           return _buildErrorSection();
//         }
//         if (snapshot.hasData) {
//           List<dynamic> data = snapshot.data!;
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 250,
//               childAspectRatio: 4 / 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               Map<String, dynamic> item = data[index];
//               ListWeaponModel weapon = ListWeaponModel.fromJson(item);
//               return InkWell(
//                 onTap: () {
//                   // Handle the item tap event
//                 },
//                 child: GridTile(
//                   child: GridTileBar(
//                     backgroundColor: Colors.black38,
//                     title: Text(
//                       weapon.name!,
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//         return _buildLoadingSection();
//       },
//     ),
//   );
// }
//
// Widget _buildLoadingSection() {
//   return CircularProgressIndicator();
// }
//
// Widget _buildErrorSection() {
//   return Container(
//     child: Text("Error"),
//   );
// }

class Weapon {
  final String name;

  Weapon({required this.name});

  factory Weapon.fromJson(String json) {
    return Weapon(name: json);
  }
}

class ListWeapon extends StatelessWidget {
  const ListWeapon({Key? key}) : super(key: key);
  Future<List<Weapon>> fetchWeapons() async {
    final response = await http.get(Uri.parse('https://api.genshin.dev/weapons'));
    if (response.statusCode == 200) {
      final List<String> data = json.decode(response.body).cast<String>();
      final weapons = data.map((json) => Weapon.fromJson(json)).toList();
      return weapons;
    } else {
      throw Exception('Failed to fetch weapons');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact Weapons'),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<Weapon>>(
          future: fetchWeapons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final weapons = snapshot.data!;
              return ListView.builder(
                itemCount: weapons.length,
                itemBuilder: (context, index) {
                  final weapon = weapons[index];
                  return InkWell(
                    onTap: () {
                      Provider.of<SelectedWeapon>(context, listen: false).setSelectedWeapon(weapon);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WeaponDetail(name: weapon.name)),
                      );
                    },
                    child: Card(
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Image.network(
                                  'https://api.genshin.dev/weapons/' + weapon.name + '/icon',

                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(weapon.name.toUpperCase()),
                              ],
                            )
                          ],
                        )
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}


