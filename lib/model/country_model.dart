class CountryFormModel {
  String countryName;
  List<String> banks;

  List<Document> documentList;
  CountryFormModel({
    required this.banks,
    required this.countryName,
    required this.documentList,
  });
}

class Document {
  String documentNAme;
  List<DocumentField> documentFields;
  Document({required this.documentNAme, required this.documentFields});
}

class DocumentField {
  String fieldName;
  String fieldType;

  DocumentField({required this.fieldName, required this.fieldType});
}
