import 'package:bestmodeling/model/country_model.dart';
import 'package:bestmodeling/widgets/custom_datepicker_for_forms.dart';
import 'package:bestmodeling/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/country_states.dart';
import '../providers/dropdown_provider.dart';
import '../providers/form_provider.dart';
import '../utils/validator.dart';

class CustomExpansionTile extends StatelessWidget {
  final String customTileName;
  final List<DocumentField> currentDocFieldList;

  const CustomExpansionTile({
    Key? key,
    required this.customTileName,
    required this.currentDocFieldList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentProvider = context.read<FormProviderNotifer>();

    return ExpansionTile(
      maintainState: true,
      title: _setTileTitle(),
      children: [
        const SizedBox(height: 10),
        ...getFieldWithTypes(currentDocFieldList, currentProvider, context),
      ],
    );
  }

  getFieldWithTypes(List<DocumentField> tempFieldDetails,
      FormProviderNotifer tempProvider, BuildContext context) {
    List<Widget> listWidget = [];
    List<String> tempfieldName =
        tempFieldDetails.map((e) => e.fieldName).toList();
    List<String> tempfieldType =
        tempFieldDetails.map((e) => e.fieldType).toList();

    for (int i = 0; i < tempfieldType.length; i++) {
      switch (tempfieldType[i].toLowerCase()) {
        case 'id':
          listWidget.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                textFieldlabel: tempfieldName[i],
                documentType: customTileName,
                textFieldHinttext: 'please enter ${tempfieldName[i]}',
                providerSetter: (setValue) {
                  tempProvider.setIdNumbers(setValue, customTileName);
                },
                formValidator: (value) {
                  return Validator().idValidator(value);
                }),
          ));

          break;
        case 'username':
          listWidget.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextFormField(
                textFieldlabel: tempfieldName[i],
                documentType: customTileName,
                textFieldHinttext: 'please enter ${tempfieldName[i]}',
                providerSetter: (enteredValue) {
                  context.read<FormProviderNotifer>().setUserName(enteredValue);
                },
                formValidator: (value) {
                  return Validator().idValidator(value);
                }),
          ));
          break;

        case 'expirydate':
          listWidget.add(CustomDatePickerForForms(
              textFormTitle: 'ExpiryDate',
              documentType: customTileName,
              type: tempfieldType[i].toLowerCase()));
          break;
        case 'issueddate':
          listWidget.add(CustomDatePickerForForms(
              textFormTitle: 'IssuedDate',
              documentType: customTileName,
              type: tempfieldType[i].toLowerCase()));
          break;

        case 'countrydropdown':
          listWidget.add(Padding(
            padding: const EdgeInsets.all(12),
            child: setIssuedPassportCountryDropDown(context),
          ));
          break;
        case 'countrystatesdropdown':
          listWidget.add(const Padding(
            padding: EdgeInsets.all(12),
            child: StateDropdown(),
          ));
          break;

        default:
          listWidget.add(const Text('error occured while creating field type'));
          break;
      }
    }
    return listWidget;
  }

  Container setIssuedPassportCountryDropDown(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      //change
      child: DropdownButtonFormField<CountryStatesModel>(
          value: context
              .watch<DropDownPoviderNotifier>()
              .getSelectedPassIssuedCountry,
          onChanged: (changedvaluefromdrop) {
            context
                .read<DropDownPoviderNotifier>()
                .setDropDownCountry(changedvaluefromdrop!);
          },
          decoration: const InputDecoration.collapsed(hintText: ''),
          borderRadius: BorderRadius.circular(20),
          alignment: Alignment.center,
          elevation: 0,
          style: const TextStyle(color: Color.fromARGB(255, 58, 183, 152)),
          //getting list and mapping string and
          //items of list country then map each element
          items: countriesInfo.map((tempValue) {
            return DropdownMenuItem<CountryStatesModel>(
              value: tempValue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Text(tempValue.countryName),
              ),
            );
          }).toList()),
    );
  }

  Padding _setTileTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [titleInnerBox(), _title()],
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      customTileName,
      style: const TextStyle(fontSize: 24),
    );
  }

  Container titleInnerBox() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: const Icon(
        Icons.badge,
        size: 40,
        color: Colors.green,
      ),
    );
  }
}

class StateDropdown extends StatelessWidget {
  const StateDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountryStatesModel selectedCountry =
        context.watch<DropDownPoviderNotifier>().getSelectedPassIssuedCountry;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        //change
        child: DropdownButtonFormField<String>(
          value: context.watch<DropDownPoviderNotifier>().currentIssuedState,
          onChanged: (changedvaluefromdrop) {
            context
                .read<DropDownPoviderNotifier>()
                .setIssuedState(changedvaluefromdrop!);
          },
          decoration: const InputDecoration.collapsed(hintText: ''),
          borderRadius: BorderRadius.circular(20),
          alignment: Alignment.center,
          elevation: 0,
          style: const TextStyle(color: Color.fromARGB(255, 58, 183, 152)),
          //getting list and mapping string and
          //items of list country then map each element
          items: getDropDownItems(context, selectedCountry),
        ));
  }

  getDropDownItems(BuildContext context, CountryStatesModel tempModel) {
    return tempModel.statesList
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ))
        .toList();
  }
}
