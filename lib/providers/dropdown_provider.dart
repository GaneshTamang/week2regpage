import 'package:flutter/material.dart';

import '../model/country_states.dart';

class DropDownPoviderNotifier extends ChangeNotifier {
  //needs to instantiate with constructor
  DropDownPoviderNotifier() {
    _selectedPassportIssuedCountry = countriesInfo[0];
    _currentSelectedState = _selectedPassportIssuedCountry.statesList[0];
    _currentSelectedBank = _selectedPassportIssuedCountry.banks[0];
  }
  late CountryStatesModel _selectedPassportIssuedCountry;
  late String _currentSelectedBank;
  late String _currentSelectedState;

  //getter
  CountryStatesModel get getSelectedPassIssuedCountry =>
      _selectedPassportIssuedCountry;
  String get currentIssuedState => _currentSelectedState;
  String get currentSelectedBank => _currentSelectedBank;

  //setter
  void setDropBank(String dropchangedBank) {
    _currentSelectedBank = dropchangedBank;
    notifyListeners();
  }

  void setIssuedState(String dropChangedCountry) {
    _currentSelectedState = dropChangedCountry;
    notifyListeners();
  }

  void setDropDownCountry(CountryStatesModel dropChangedCountry) {
    _selectedPassportIssuedCountry = dropChangedCountry;
    _currentSelectedState = _selectedPassportIssuedCountry.statesList[0];
    notifyListeners();
  }
}
