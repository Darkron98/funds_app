import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/models.dart';
import '../../../bloc/funds_bloc.dart';
import '../widgets.dart';

class FundList extends StatelessWidget {
  const FundList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundsBloc, FundsState>(
      builder: (context, state) {
        return (state.isFundsLoading ?? true) && state.funds.isEmpty
            ? const DotsLoader(scale: 10)
            : ResponsiveList<Fund>(
                items: state.funds,
                itemBuilder: (context, fund, index) {
                  return FundItem(fund: fund);
                },
                message: 'No hay fondos',
              );
      },
    );
  }
}
