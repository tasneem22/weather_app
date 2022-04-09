import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';
/**
 * data to be stored
 * language for the app
 * unit used in app(for both weather & wind)
 * cities added so far
 * last call given the citytgftrrrttt
 */

class StorageService {
  late var _prefs;
  Future<bool> readData() async {
    _prefs = await SharedPreferences.getInstance();
    constants.metrics = _prefs.getString('unit');
    print(constants.metrics);
    if (constants.metrics == null) constants.metrics = 'standard';
    constants.language = _prefs.getString('language');
    if (constants.language == null) constants.language = 'en';
    constants.cities = _prefs.getStringList('cities');
    if (constants.cities == null) return false;
    return true;
  }

  changeLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('language', constants.language);
  }

  changeUnit() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('unit', constants.metrics);
  }

  addCity(String cityName, double lat, double lng) async {
    // await _prefs
    //     .setStringList(cityName, <String>[lat.toString(), lng.toString()]);
    _prefs = await SharedPreferences.getInstance();
    if (constants.cities == null) constants.cities = [];
    constants.cities!.add(cityName);
    await _prefs.setStringList('cities', constants.cities);
  }
}
