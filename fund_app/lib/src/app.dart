import 'package:flutter/material.dart';

import 'features/funds/presentation/screens/funds.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FundsPage(title: 'Flutter Demo Home Page'),
    );
  }
}
