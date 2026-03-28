import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/funds/balance_widget.dart';

import '../widgets.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceWidget(balance: 500000),
        TransactionsWidget(),
      ],
    );
  }
}
