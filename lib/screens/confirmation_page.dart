import 'package:bestmodeling/screens/notification_page.dart';
import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String sendamount;
  final String bankACNum;
  final String recipeintsRefrence;
  final String payDetails;
  const ConfirmationPage(
      {Key? key,
      required this.sendamount,
      required this.bankACNum,
      required this.recipeintsRefrence,
      required this.payDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Confirm'),
      // ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 100),
            _displayMyr(),
            const SizedBox(height: 20),
            _displayBankAcNumber(),
            const SizedBox(height: 20),
            _displayRecipientsRefrence(),
            const SizedBox(height: 20),
            _displayPayDetails(),
            const SizedBox(height: 140),
            _setConfirmationButtons(context),
          ],
        ),
      ),
    );
  }

  Row _setConfirmationButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _setSendConfirmationButton(context),
        _setCancelConfirmationButton(context)
      ],
    );
  }

  ElevatedButton _setCancelConfirmationButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Cancel'));
  }

  ElevatedButton _setSendConfirmationButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  NotificationPAge(price: sendamount, acNo: bankACNum)));
        },
        child: const Text(
          'OK Send',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  Text _displayPayDetails() {
    return Text('Pay Details:\n$payDetails',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25));
  }

  Text _displayRecipientsRefrence() {
    return Text('Recipeints Refrence:\n $recipeintsRefrence',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25));
  }

  Text _displayBankAcNumber() {
    return Text(
      'Bank Account Number:\n$bankACNum',
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }

  Text _displayMyr() {
    return Text(
      'Sendamount: MYR $sendamount ',
      textAlign: TextAlign.center,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
