import 'package:flutter/material.dart';
import 'package:lat_responsi/karakter/list_karakter.dart';
import 'package:lat_responsi/weapon/detail_weapon.dart';
import 'package:lat_responsi/weapon/list_weapon.dart';
import 'package:lat_responsi/weapon/selected_weapon.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final selectedWeapon = Provider.of<SelectedWeapon>(context).selectedWeapon;
    return Scaffold(
      body: Container(
      child: ListView(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget> [
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Image.asset(
                      'assets/genshin_logo.png',
                      fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  // if (selectedWeapon != null) ...[
                  //   Container(
                  //     decoration: BoxDecoration(
                  //       color: Color.fromRGBO(242, 227, 219, 1),
                  //       border: Border.all(
                  //         color: Colors.black,
                  //         width: 1.0,
                  //       ),
                  //       borderRadius: BorderRadius.circular(8.0),
                  //     ),
                  //     padding: EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         // Display the selected weapon's icon
                  //         Image.network(
                  //           'https://api.genshin.dev/weapons/${selectedWeapon.name}/icon',
                  //           width: 50,
                  //           height: 50,
                  //         ),
                  //         SizedBox(height: 10),
                  //         // Display the selected weapon's name
                  //         Text(selectedWeapon.name),
                  //       ],
                  //     ),
                  //   ),
                  // ],
                  if (selectedWeapon != null) ...[
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => WeaponDetail(name: weapon.name)),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(242, 227, 219, 1), // Background color of the button
                        onPrimary: Colors.black, // Text color of the button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Colors.black, width: 1.0),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            // Display the selected weapon's icon
                            Image.network(
                              'https://api.genshin.dev/weapons/${selectedWeapon.name}/icon',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(height: 10),
                            // Display the selected weapon's name
                            Text(selectedWeapon.name),
                          ],
                        ),
                      ),
                    ),
                  ],
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListKarakter()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Character',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks tombol
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListWeapon()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Weapon',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Warna teks tombol
                        ),
                      ),
                    ),
                  ),
                ]
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//
//     );
//   }
// }
// child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//     ElevatedButton(
//       onPressed: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => Anggota()),
//         // );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//         child: Text(
//           'Character',
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white, // Warna teks tombol
//           ),
//         ),
//       ),
//     ),
//     SizedBox(
//       height: 16.0,
//     ),
//     ElevatedButton(
//       onPressed: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => Anggota()),
//         // );
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Color.fromRGBO(38, 58, 41, 1), // Warna latar belakang tombol
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0), // Mengatur radius sudut tombol
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//         child: Text(
//           'Weapon',
//           style: TextStyle(
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//             color: Colors.white, // Warna teks tombol
//           ),
//         ),
//       ),
//     ),
//   ],
// ),


