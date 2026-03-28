import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/logic.dart';
import '../../../bloc/funds_bloc.dart';
import '../widgets.dart';

class FundsSection extends StatelessWidget {
  const FundsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FundsBloc, FundsState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fondos",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: responsiveSize(context),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 15),
            const Expanded(child: FundList()),
          ],
        ),
      ),
    );
  }
}
