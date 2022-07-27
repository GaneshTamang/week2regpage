import 'package:bestmodeling/model/country_model.dart';
import 'package:bestmodeling/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class CustomCountryDropDown extends StatelessWidget {
  const CustomCountryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonFormField<CountryFormModel>(
          //underline for dropdown front view
          value: context.watch<FormProviderNotifer>().providerSelectedCountry,
          onChanged: (changedvaluefromdrop) {
            context
                .read<FormProviderNotifer>()
                .setDropDownCountry(changedvaluefromdrop!);
          },
          decoration: const InputDecoration.collapsed(hintText: ''),
          borderRadius: BorderRadius.circular(20),
          alignment: Alignment.center,
          elevation: 0,
          style: const TextStyle(color: Color.fromARGB(255, 58, 183, 152)),
          //getting list and mapping string and
          //items of list country then map each elemen
          items: countries.map((elementsofcountry) {
            return DropdownMenuItem<CountryFormModel>(
              value: elementsofcountry,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Text(elementsofcountry.countryName),
              ),
            );
          }).toList()),
    );
  }
}
