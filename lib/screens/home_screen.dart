import 'package:bestmodeling/model/country_model.dart';
import 'package:bestmodeling/widgets/custom_dropdown.dart';
import 'package:bestmodeling/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentModelvalue =
        context.watch<FormProviderNotifer>().providerSelectedCountry;

    final regPageFormKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: regPageFormKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              _buildSelectCountryFormTypeDropDown(),
              ..._buildExpansionTile(currentModelvalue),
              _buildSubmitButton(regPageFormKey, context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildSelectCountryFormTypeDropDown() {
    return const Padding(
      padding: EdgeInsets.all(14),
      child: CustomCountryDropDown(),
    );
  }

  ElevatedButton _buildSubmitButton(
      GlobalKey<FormState> regPageFormKey, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final isValidform = regPageFormKey.currentState!.validate();
          if (isValidform) {
            Navigator.pushNamed(context, '/displayProviderValue');
          }
        },
        child: const Text('Submit'));
  }

  AppBar _buildAppBar() => AppBar(title: const Text('HomePage'));

  List<CustomExpansionTile> _buildExpansionTile(CountryFormModel country) {
    return country.documentList
        .map((e) => CustomExpansionTile(
              customTileName: e.documentNAme,
              currentDocFieldList: e.documentFields,
            ))
        .toList();
  }
}
