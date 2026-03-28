import 'package:flutter/material.dart';
import '../widgets.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        BalanceWidget(balance: 500000),
        Expanded(child: TransactionsWidget()),
      ],
    );
  }
}
