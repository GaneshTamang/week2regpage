import 'package:bestmodeling/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatelessWidget {
  final String textFieldlabel;
  final String documentType;
  final String textFieldHinttext;
  final Function(String value) providerSetter;
  final Function formValidator;

  const CustomTextFormField({
    Key? key,
    required this.textFieldlabel,
    required this.documentType,
    required this.textFieldHinttext,
    required this.providerSetter,
    required this.formValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        providerSetter(value);
      },
      validator: (value) {
        return formValidator(value);
      },
      decoration: inputDecoration(),
    );
  }

  getInitialValue(String currentDocumentType, BuildContext context) {
    String checkString = currentDocumentType;
    switch (checkString.toLowerCase()) {
      case 'myinfo':
        context.watch<FormProviderNotifer>().getmyInfoIdNum;
        break;

      default:
        'Error';
        break;
    }
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      labelText: textFieldlabel,
      hintText: textFieldHinttext,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 235, 26, 11), width: 1.5),
      ),
    );
  }
}
