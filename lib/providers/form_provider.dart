import 'dart:developer';

import 'package:bestmodeling/model/country_model.dart';
import 'package:bestmodeling/model/country_states.dart';
import 'package:bestmodeling/utils/constants.dart';
import 'package:flutter/material.dart';

class FormProviderNotifer extends ChangeNotifier {
  CountryFormModel _selectedCountry = countries[0];
  //pass
  String _passPortIdNumber = 'default Passport Id initial Value';
  DateTime _passportIssuedDate = DateTime.now();
  DateTime _passportExpiryDate = DateTime.now();
  CountryStatesModel _currentPassportIssuedCountry = countriesInfo[0];
//drivingLicence
  String _drivingLicenceIdNumber = '';
  DateTime _drivingLicenceExpiryDate = DateTime.now();
  //NewIC
  String _newICIdNumber = '';
  DateTime _newICExpiryDate = DateTime.now();
  //MyPR
  String _myPRIdNumber = '';
  DateTime _myPRExpiryDate = DateTime.now();
  CountryStatesModel _currentMyPRIssuedState = countriesInfo[0];
  //MyInfo
  String _myInfouserNAme = '';
  String _myInfoIdNum = 'i m id info';

  //getters
  CountryFormModel get providerSelectedCountry => _selectedCountry;
//pass
  String get getpassportNumber => _passPortIdNumber;
  DateTime get getpassportIssued => _passportIssuedDate;
  DateTime get getpassportExpiry => _passportExpiryDate;
  CountryStatesModel get getpassportIssuedCountry =>
      _currentPassportIssuedCountry;
  //drivinglicence
  String get getdrivingLicenceNumber => _drivingLicenceIdNumber;
  DateTime get getdrivingExpiry => _drivingLicenceExpiryDate;
  String get getnewICIdNum => _newICIdNumber;
  DateTime get getnewIcExpiry => _newICExpiryDate;
  //MyPR
  String get getmyPrIdNum => _myPRIdNumber;
  DateTime get getmyPrExpiry => _myPRExpiryDate;
  CountryStatesModel get getmyPRIssuedState => _currentMyPRIssuedState;
  //MyInfo
  String get getmyINfoUserNAme => _myInfouserNAme;
  String get getmyInfoIdNum => _myInfoIdNum;

  //setter methods
  void setUserName(String userNAme) {
    _myInfouserNAme = userNAme;
  }

  void issuedCountry(CountryStatesModel issuedcountry) {
    _currentPassportIssuedCountry = issuedcountry;
    notifyListeners();
  }

  void setDropDownCountry(CountryFormModel dropChangedCountry) {
    _selectedCountry = dropChangedCountry;
    notifyListeners();
  }

  void setDropdownStates(CountryStatesModel temp) {
    _currentMyPRIssuedState = temp;
  }

  void setIdNumbers(String tempIdDetails, String tempDocumentName) {
    String documentName = tempDocumentName.toLowerCase();

    switch (documentName) {
      //dont use notify in eachbuild
      case 'passport':
        _passPortIdNumber = tempIdDetails;
        break;
      case 'drivinglicence':
        _drivingLicenceIdNumber = tempIdDetails;
        break;
      case 'newic':
        _newICIdNumber = tempIdDetails;
        break;
      case 'mypr':
        _myPRIdNumber = tempIdDetails;
        break;
      case 'myinfo':
        _myInfoIdNum = tempIdDetails;
        break;

      default:
        break;
    }
  }

  void setIssuedDate(DateTime tempIssuedDate, String tempDocoumentName) {
    String documentName = tempDocoumentName.toLowerCase();

    switch (documentName) {
      case 'passport':
        _passportIssuedDate = tempIssuedDate;

        break;
      default:
        break;
    }
    log(tempIssuedDate.toString());
  }

  void setExpiryDate(DateTime tempExpiryDate, String tempDocoumentName) {
    String documentName = tempDocoumentName.toLowerCase();

    switch (documentName) {
      case 'passport':
        _passportExpiryDate = tempExpiryDate;

        break;
      case 'drivinglicence':
        _drivingLicenceExpiryDate = tempExpiryDate;

        break;
      case 'newic':
        _newICExpiryDate = tempExpiryDate;

        break;
      case 'mypr':
        _myPRExpiryDate = tempExpiryDate;

        break;

      default:
        break;
    }
  }
}
