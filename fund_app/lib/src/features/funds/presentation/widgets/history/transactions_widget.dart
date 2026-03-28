import 'package:flutter/material.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/widgets.dart';

import '../../../../../core/utils/logic.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Historial",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: responsiveSize(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(child: HistoryList()),
          ],
        ),
      ),
    );
  }
}
