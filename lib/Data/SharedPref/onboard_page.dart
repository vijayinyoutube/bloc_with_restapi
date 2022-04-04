import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class OnboardPref {
  final bool? isFav;
  final int? id;
  OnboardPref({
    this.isFav,
    this.id,
  });

  Future<void> saveisFavasJson(int index, bool isFav) async {
    final prefs = await SharedPreferences.getInstance();

    OnboardPref _onboardPref = OnboardPref(id: index, isFav: isFav);

    Map<String, dynamic> map = {
      'id': _onboardPref.id,
      'isFav': _onboardPref.isFav
    };
    String rawJson = jsonEncode(map);
    prefs.setString('isFav', rawJson);
  }

  getisFavasJson(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final rawJson = prefs.getString('isFav') ?? '';
    Map<String, dynamic> map = jsonDecode(rawJson);
    final _onboardPref = OnboardPref(id: map['id'], isFav: map['isFav']);
    print("_onboardPref.isFav ${_onboardPref.isFav}");
    return _onboardPref.isFav;
  }

  Future<void> saveisFav(int index, bool isFav) async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('$index') == true) {
      prefs.setBool('$index', false);
    } else {
      prefs.setBool('$index', true);
    }
  }

  Future<bool> getisFav(int index) async {
    final prefs = await SharedPreferences.getInstance();

    bool isFav = prefs.getBool('$index') ?? false;
    print("isFav $isFav");
    return isFav;
  }
}
