import 'package:flutter/material.dart';

import 'features/funds/presentation/screens/funds/funds.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funds app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FundsPage(title: 'Funds app'),
    );
  }
}
