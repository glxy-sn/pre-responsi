import 'package:flutter/material.dart';
import 'package:lat_responsi/dashboard.dart';
import 'package:lat_responsi/weapon/selected_weapon.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SelectedWeapon>(
      create: (_) => SelectedWeapon(),
      child: MaterialApp(
        title: 'Genshin Impact App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
      ),
    );
  }
}

