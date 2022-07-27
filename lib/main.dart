import 'package:bestmodeling/providers/dropdown_provider.dart';
import 'package:bestmodeling/screens/send_money_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/form_provider.dart';
import 'screens/home_screen.dart';
import 'screens/display_provider_value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FormProviderNotifer()),
        ChangeNotifierProvider(create: (context) => DropDownPoviderNotifier())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          //passing widget context on route homepage
          '/': (context) => const Homepage(),
          // '/secondPage': (context) => const SecondPage(),
          '/displayProviderValue': (context) => const DisplayProviderValue(),
          '/sendMoneyPage': (context) => const SendMoneyPage(),
        },
      ),
    );
  }
}
