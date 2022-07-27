import 'package:bestmodeling/providers/dropdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/form_provider.dart';

class DisplayProviderValue extends StatelessWidget {
  const DisplayProviderValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: ListView(
        children: [
          buildProviderDisplayText(),
          buildAnotherProviderDisplayText(),
          buildSendMoneyButton(context)
        ],
      ),
    );
  }

  ElevatedButton buildSendMoneyButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/sendMoneyPage');
        },
        child: const Text('Send Money'));
  }

  AppBar _buildAppbar() => AppBar(title: const Text('Second Page'));

  Consumer<FormProviderNotifer> buildProviderDisplayText() {
    return Consumer<FormProviderNotifer>(builder: (context, ref, child) {
      //accessed from gettter
      return buildTextDiplay(ref);
    });
  }

  Consumer<DropDownPoviderNotifier> buildAnotherProviderDisplayText() {
    return Consumer<DropDownPoviderNotifier>(builder: (context, ref, child) {
      return Text('''

                  currentPasspotissueDrop: ${ref.getSelectedPassIssuedCountry.countryName}
                  currentstatesissueDrop:  ${ref.currentIssuedState}
''');
    });
  }

  Text buildTextDiplay(FormProviderNotifer ref) {
    return Text('''
 
                       Currently Provider having value
           
            Username: ${ref.getmyINfoUserNAme}
             Id num:   ${ref.getmyInfoIdNum}
           
            passport id num: ${ref.getpassportNumber} 
            passport issue:  ${ref.getpassportIssued.year}/${ref.getpassportIssued.month}/${ref.getpassportIssued.day}
            passport expiry: ${ref.getpassportExpiry.year} /${ref.getpassportExpiry.month}/ ${ref.getpassportExpiry.day} 

            driving licence no:     ${ref.getdrivingLicenceNumber}
            driving licence expiry: ${ref.getdrivingExpiry.year}/${ref.getdrivingExpiry.month}/${ref.getdrivingExpiry.day}


            new Ic ID:     ${ref.getnewICIdNum}
            new IC Expiry: ${ref.getnewIcExpiry.year}/${ref.getnewIcExpiry.month}/${ref.getnewIcExpiry.day}


            my pr idNUM:        ${ref.getmyPrIdNum}
            my pr expiry:       ${ref.getmyPrExpiry.year}/${ref.getmyPrExpiry.month}/${ref.getmyPrExpiry.day}
            ''',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ));
  }
}
