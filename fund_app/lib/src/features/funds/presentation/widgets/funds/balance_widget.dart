import 'package:flutter/material.dart';

import '../../../../../core/utils/logic.dart';
import '../widgets.dart';

class BalanceWidget extends StatelessWidget {
  final double balance;
  const BalanceWidget({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  "Balance",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: responsiveSize(context),
                  ),
                ),
                const BadgeWidget(scale: 14)
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "\$${balance.toStringAsFixed(0)}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
