import 'dart:developer';

import 'package:bestmodeling/screens/confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/country_states.dart';
import '../providers/dropdown_provider.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  Color box1 = Colors.white;
  Color box2 = Colors.white;
  Color box3 = Colors.white;
  TextEditingController sendAmountController = TextEditingController();
  TextEditingController getBankAcNumberController = TextEditingController();
  TextEditingController getRecipeintsRefrenceController =
      TextEditingController();
  TextEditingController getOtherPayDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sendMoneyPageFormKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: _setappbar(context),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: sendMoneyPageFormKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: buildColumnMainBody(sendMoneyPageFormKey, context),
          ),
        ));
  }

  Padding buildColumnMainBody(
      GlobalKey<FormState> outPageformkey, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setHeaderEnterAmount(),
          _getSendMoneyTextFormField(),
          _setTitleFeesAndCharges(),
          const SizedBox(height: 10),
          _buildSendMoneySelectionBox(),
          _buildHeaderBankName(),
          _buildChooseBAnkDropDown(context),
          const SizedBox(height: 30),
          _getBAnkAcNumberTextFormField(),
          const SizedBox(height: 30),
          _getRecipientsRefrenceTextFormField(),
          const SizedBox(height: 30),
          _getOtherDetailsTextForm(),
          const SizedBox(height: 80),
          _setContineButton(outPageformkey, context)
        ],
      ),
    );
  }

  Container _buildChooseBAnkDropDown(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
        //change
        child: DropdownButtonFormField<String>(
          value: context.watch<DropDownPoviderNotifier>().currentSelectedBank,
          onChanged: (changedvaluefromdrop) {
            context
                .read<DropDownPoviderNotifier>()
                .setDropBank(changedvaluefromdrop!);
          },
          decoration: const InputDecoration.collapsed(hintText: ''),
          borderRadius: BorderRadius.circular(20),
          alignment: Alignment.center,
          elevation: 0,
          style: const TextStyle(color: Color.fromARGB(255, 58, 183, 152)),
          //getting list and mapping string and
          //items of list country then map each element
          items: getDropDownItems(
              context,
              context
                  .watch<DropDownPoviderNotifier>()
                  .getSelectedPassIssuedCountry),
        ));
  }

  getDropDownItems(BuildContext context, CountryStatesModel tempModel) {
    return tempModel.banks
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Text(e),
              ),
            ))
        .toList();
  }

  Text _setHeaderEnterAmount() {
    return const Text(
      'Enter Amount',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Padding _setTitleFeesAndCharges() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Fees & Charges RM 0.00'),
    );
  }

  TextFormField _getSendMoneyTextFormField() {
    return TextFormField(
      validator: (cntrlrvalue) {
        if (cntrlrvalue != null && cntrlrvalue.length < 3) {
          return 'atleast 3 digit num please';
        }
        return null;
      },
      controller: sendAmountController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: setDecoration(),
    );
  }

  InputDecoration setDecoration() {
    return InputDecoration(
      prefixIcon: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Text(
          'MYR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 172, 106, 106), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 235, 26, 11), width: 1.5),
      ),
      hintText: 'Enter Amount',
      labelText: 'Amount',
      contentPadding: const EdgeInsets.all(8),
    );
  }

  ElevatedButton _setContineButton(
      GlobalKey<FormState> outPageformkey, BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final isValidform = outPageformkey.currentState!.validate();

          if (isValidform) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ConfirmationPage(
                    sendamount: sendAmountController.text,
                    bankACNum: getBankAcNumberController.text,
                    recipeintsRefrence: getRecipeintsRefrenceController.text,
                    payDetails: getOtherPayDetailsController.text),
              ),
            );
          }
        },
        child: Container(
            padding: const EdgeInsets.only(
                left: 100, right: 110, top: 15, bottom: 15),
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )));
  }

  TextFormField _getOtherDetailsTextForm() {
    return TextFormField(
      controller: getOtherPayDetailsController,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        // focusedBorder: OutlineInputBorder(

        hintText: "October",
        labelText: "Other Payment Details",

        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }

  TextFormField _getRecipientsRefrenceTextFormField() {
    return TextFormField(
      controller: getRecipeintsRefrenceController,
      keyboardType: TextInputType.text,
      validator: (cntrlrvalue) {
        if (cntrlrvalue != null && cntrlrvalue.length < 14) {
          return 'enter atleast 14 char';
        }
        return null;
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        // focusedBorder: OutlineInputBorder(

        hintText: "Brother's Allowance",
        labelText: "Recipient's Refrence",

        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }

  TextFormField _getBAnkAcNumberTextFormField() {
    return TextFormField(
      controller: getBankAcNumberController,
      keyboardType: TextInputType.number,
      validator: (cntrlrvalue) {
        if (cntrlrvalue != null && cntrlrvalue.length < 14) {
          return 'enter atleast 14 char';
        }
        return null;
      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black, width: 1.5),
        ),
        // focusedBorder: OutlineInputBorder(

        hintText: '1510 234 5678',
        labelText: 'Bank Account Number',

        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }

  Padding _buildHeaderBankName() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bank Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  Container _buildSendMoneySelectionBox() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //box1
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  log(box1.toString());
                  log(box2.toString());
                  log(box3.toString());
                  box1 = Colors.greenAccent;
                  box2 = Colors.white;
                  box3 = Colors.white;
                  sendAmountController.text = '100';
                });
              },
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: box1),
                child: const Text(
                  '100',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          // box2
          Flexible(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    box1 = Colors.white;
                    box2 = Colors.greenAccent;
                    box3 = Colors.white;
                    sendAmountController.text = '200';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: box2,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: const Text(
                    '200',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          //box3
          Flexible(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    box1 = Colors.white;
                    box2 = Colors.white;
                    box3 = Colors.greenAccent;
                    sendAmountController.text = '300';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 8),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: box3,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: const Text(
                    '300',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  AppBar _setappbar(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      title: const Text(
        'Send Money',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    );
  }
}
