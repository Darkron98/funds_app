import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_app/src/core/models/models.dart';
import '../../../bloc/funds_bloc.dart';
import '../widgets.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundsBloc, FundsState>(
      builder: (context, state) {
        return (state.isHistoryLoading) ?? false
            ? const DotsLoader(scale: 10)
            : ResponsiveList<Transaction>(
                items: state.transactions,
                itemBuilder: (context, transaction, index) {
                  return HistoryItem(transaction: transaction);
                },
                message: 'No hay transacciones',
              );
      },
    );
  }
}
