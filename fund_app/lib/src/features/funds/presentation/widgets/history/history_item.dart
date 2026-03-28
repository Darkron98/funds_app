import 'package:flutter/material.dart';

import '../../../../../core/models/models.dart';
import '../../../../../core/utils/logic.dart';

class HistoryItem extends StatelessWidget {
  final Transaction transaction;
  const HistoryItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromARGB(255, 235, 235, 235),
                child: Text(
                  transaction.fundType,
                  style: TextStyle(
                    fontSize: responsiveSize(context),
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: responsiveSize(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDate(transaction.date),
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                  const SizedBox(height: 7),
                  Tooltip(
                    message: formatText(transaction.fundName),
                    child: Text(
                      formatText(transaction.fundName),
                      style: const TextStyle(
                          fontSize: 14, overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              /* const BadgeWidget(scale: 10), */
              Row(
                children: [
                  Text(
                    '\$ ${formatCurrency(transaction.amount)}',
                    style: TextStyle(fontSize: responsiveSize(context)),
                  ),
                  Icon(
                    transaction.type == 'Cancelacion'
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: transaction.type == 'Cancelacion'
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    size: 30,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
