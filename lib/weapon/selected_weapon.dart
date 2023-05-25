import 'package:flutter/material.dart';
import 'package:lat_responsi/weapon/list_weapon.dart';

class SelectedWeapon extends ChangeNotifier {
  Weapon? _selectedWeapon;

  Weapon? get selectedWeapon => _selectedWeapon;

  void setSelectedWeapon(Weapon weapon) {
    _selectedWeapon = weapon;
    notifyListeners();
  }
}
