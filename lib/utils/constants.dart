//form data
import '../model/country_model.dart';

List<CountryFormModel> countries = [
  CountryFormModel(
    banks: ['bank1', 'bank2', 'bank3', 'bank4'],
    countryName: 'Singapore',
    documentList: [
      Document(
        documentNAme: 'MyInfo',
        documentFields: [
          DocumentField(fieldName: 'UserName', fieldType: 'UserName'),
          DocumentField(fieldName: 'Id', fieldType: 'id')
        ],
      ),
    ],
  ),
  CountryFormModel(
    banks: ['bank1', 'bank2', 'bank3', 'bank4'],
    countryName: 'Nepal',
    documentList: [
      Document(
        documentNAme: 'Passport',
        documentFields: [
          DocumentField(fieldName: 'Id NUmber', fieldType: 'id'),
          DocumentField(fieldName: 'ExpiryDate', fieldType: 'expirydate'),
          DocumentField(fieldName: 'IssuedDate', fieldType: 'issueddate'),
        ],
      ),
      Document(
        documentNAme: 'DrivingLicence',
        documentFields: [
          DocumentField(fieldName: 'Id Number', fieldType: 'id'),
          DocumentField(fieldName: 'Valid Upto', fieldType: 'Expirydate'),
        ],
      ),
    ],
  ),
  CountryFormModel(
    banks: ['bank1', 'bank2', 'bank3', 'bank4'],
    countryName: 'Malaysia',
    documentList: [
      Document(
        documentNAme: 'NewIC',
        documentFields: [
          DocumentField(fieldName: 'IdNumber', fieldType: 'ID'),
          DocumentField(fieldName: 'ExpiryDate', fieldType: 'expirydate'),
        ],
      ),
      Document(documentNAme: 'PassPort', documentFields: [
        DocumentField(fieldName: 'IdNumber', fieldType: 'id'),
        DocumentField(fieldName: 'ExpiryDate', fieldType: 'expirydate'),
        DocumentField(fieldName: 'IssuedDate', fieldType: 'IssuedDate'),
        DocumentField(fieldName: 'CountryOfIssue', fieldType: 'countryDropdown')
      ]),
      Document(documentNAme: 'MyPR', documentFields: [
        DocumentField(fieldName: 'IdNumber', fieldType: 'id'),
        DocumentField(fieldName: 'ExpiryDate', fieldType: 'ExpiryDate'),
        DocumentField(
            fieldName: 'IssuedState', fieldType: 'countryStatesDropdown'),
      ])
    ],
  ),
];
