import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_app/src/features/funds/bloc/funds_bloc.dart';
import 'features/funds/presentation/screens/funds/funds.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FundsBloc>(
      create: (context) => FundsBloc()
        ..add(LoadFunds())
        ..add(LoadTransactions()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Funds app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FundsPage(title: 'Funds app'),
      ),
    );
  }
}
