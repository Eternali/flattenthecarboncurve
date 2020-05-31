import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CarType { small, average, suv, hybrid, none }
enum Diet { meatHeavy, average, lowMeat, noBeef, vegetarian, vegan }
enum HouseSize { small, average, large }

class User with ChangeNotifier {
  User({
    this.hasCompletedSignup,
    int planeHours = 0,
    double drivingHours = 0,
    CarType carType = CarType.average,
    int busHours = 0,
    Diet diet = Diet.average,
    HouseSize houseSize = HouseSize.average,
  })  : _planeHours = planeHours,
        _drivingHours = drivingHours,
        _carType = carType,
        _busHours = busHours,
        _diet = diet,
        _houseSize = houseSize;

  bool hasCompletedSignup;

  int _planeHours;
  int get planeHours => _planeHours;
  set planeHours(hours) {
    _planeHours = hours;
    notifyListeners();
    sharedPrefs.setInt('planeHours', hours);
  }

  double _drivingHours;
  double get drivingHours => _drivingHours;
  set drivingHours(hours) {
    _drivingHours = hours;
    notifyListeners();
    sharedPrefs.setDouble('drivingHours', hours);
  }

  CarType _carType;
  CarType get carType => _carType;
  set carType(type) {
    _carType = type;
    notifyListeners();
    sharedPrefs.setInt('carType', CarType.values.indexOf(type));
  }

  int _busHours;
  int get busHours => _busHours;
  set busHours(hours) {
    _busHours = hours;
    notifyListeners();
    sharedPrefs.setInt('busHours', hours);
  }

  Diet _diet;
  Diet get diet => _diet;
  set diet(type) {
    _diet = type;
    notifyListeners();
    sharedPrefs.setInt('diet', Diet.values.indexOf(type));
  }

  HouseSize _houseSize;
  HouseSize get houseSize => _houseSize;
  set houseSize(size) {
    _houseSize = size;
    notifyListeners();
    sharedPrefs.setInt('houseSize', HouseSize.values.indexOf(size));
  }

  // Hours per year * lbs CO2 per hour.
  double get planeFootprint => planeHours * 551.155;
  // Hours per day * lbs CO2 per hour * days per year.
  double get drivingFootprint {
    double footprint = 0;
    drivingHours ??= 0;
    switch (carType) {
      case CarType.small:
        footprint = drivingHours * 18.18200345;
        break;
      case CarType.average:
        footprint = drivingHours * 22.56152992;
        break;
      case CarType.suv:
        footprint = drivingHours * 31.39599342;
        break;
      case CarType.hybrid:
        footprint = drivingHours * 12.54814588;
        break;
      case CarType.none:
        footprint = 0;
    }
    return footprint * 365;
  }
  // Hours per week * lbs CO2 per hour * weeks per year.
  double get busFootprint => busHours * 15.4323 * 52.1429;
  // Diet lbs CO2 per year.
  double get dietFootprint {
    switch (diet) {
      case Diet.meatHeavy:
        return 7275.246;
      case Diet.average:
        return 5511.55;
      case Diet.lowMeat:
        return 4012.11084;
      case Diet.noBeef:
        return 4188.778;
      case Diet.vegetarian:
        return 3747.854;
      case Diet.vegan:
        return 3306.93;
    }
  }
  // Average lbs CO2 per year of house.
  double get houseFootprint {
    switch (houseSize) {
      case HouseSize.small:
        return 8712.65824;
      case HouseSize.average:
        return 13527.54832;
      case HouseSize.large:
        return 20062.042;
    }
  }

  double get totalFootprint {
    return planeFootprint + drivingFootprint + busFootprint + dietFootprint + houseFootprint;
  }

  static SharedPreferences sharedPrefs;

  Future<void> load() async {
    sharedPrefs ??= await SharedPreferences.getInstance();
    hasCompletedSignup = sharedPrefs.getBool('hasCompletedSignup') ?? false;
    // _planeHours = sharedPrefs.getInt('planeHours') ?? 0;
    // _drivingHours = sharedPrefs.getDouble('drivingHours') ?? 0;
    // _carType = CarType.values[sharedPrefs.getInt('carType') ?? 0];
    // _busHours = sharedPrefs.getInt('busHours') ?? 1;
    // _diet = Diet.values[sharedPrefs.getInt('diet') ?? 1];
    // _houseSize = HouseSize.values[sharedPrefs.getInt('houseSize') ?? 1];
    notifyListeners();
  }

  Future<void> completeSignup() async {
    sharedPrefs ??= await SharedPreferences.getInstance();
    await sharedPrefs.setBool('hasCompletedSignup', true);
    return hasCompletedSignup = true;
  }
}
