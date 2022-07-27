import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class CustomDatePickerForForms extends StatelessWidget {
  final String textFormTitle;
  final String documentType;
  final String type;
  const CustomDatePickerForForms(
      {Key? key,
      required this.textFormTitle,
      required this.documentType,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final readformProvider = context.read<FormProviderNotifer>();
    // final watchformprovider = context.watch<FormProviderNotifer>();
    DateTime currentProviderDate = DateTime.now();

    final myformat = DateFormat('dd-MMMM-yyyy');
    return Padding(
      padding: const EdgeInsets.all(15),
      child: DateTimeField(
        validator: dateValidator,
        format: myformat,
        onShowPicker: (context, currentValue) async {
          // final formProvider = context.read<FormProviderNotifer>();
          DateTime? newdate = await showDatePicker(
            context: context,
            initialDate: currentProviderDate,
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (newdate != null) {
            if (type == 'expirydate') {
              readformProvider.setExpiryDate(newdate, documentType);
            }
            if (type == 'issueddate') {
              readformProvider.setIssuedDate(newdate, documentType);
            }

            return newdate;
          }
          return null;
        },
        decoration: textformInputDecoration(),
      ),
    );
  }

  String? dateValidator(value) {
    if (value == null) {
      return 'Empty Date?';
    }
    return null;
  }

  InputDecoration textformInputDecoration() {
    return InputDecoration(
      hintText: 'Please enter ' ' $documentType' '  $textFormTitle date',
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
