import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_app/src/core/utils/logic.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/widgets.dart';

import '../../../../../core/models/models.dart';
import '../../../bloc/funds_bloc.dart';

class FundItem extends StatelessWidget {
  final Fund fund;
  const FundItem({
    super.key,
    required this.fund,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 243, 243),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: formatText(fund.name),
                      child: Text(
                        formatText(fund.name),
                        style: const TextStyle(
                            fontSize: 14, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fund.category,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        const SizedBox(width: 50),
                        Text(
                          'Monto: \$ ${formatCurrency(fund.minAmount)}',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ],
                ),
                BlocBuilder<FundsBloc, FundsState>(
                  buildWhen: (prev, curr) =>
                      prev.selectedFund != curr.selectedFund,
                  builder: (context, state) {
                    final isLoading = state.selectedFund == fund.id;

                    if (isLoading) {
                      return const SizedBox(
                        width: 60,
                        child: DotsLoader(scale: 5),
                      );
                    }

                    return TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          !fund.subscribed
                              ? const Color.fromARGB(255, 183, 241, 213)
                              : const Color.fromARGB(255, 243, 150, 150),
                        ),
                      ),
                      onPressed: () {
                        context.read<FundsBloc>().add(SubscribeFund(fund));
                      },
                      child: Text(
                        !fund.subscribed ? 'Suscribir' : 'Cancelar',
                        style: TextStyle(
                          color: !fund.subscribed
                              ? const Color.fromARGB(255, 80, 155, 119)
                              : Colors.red,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
