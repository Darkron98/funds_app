import 'package:flutter/material.dart';

import '../../../../../core/utils/logic.dart';
import '../widgets.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                        '${index + 1}',
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
                          '27 de marzo',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          '\$90000',
                          style: TextStyle(fontSize: responsiveSize(context)),
                        )
                      ],
                    ),
                  ],
                ),
                const BadgeWidget(scale: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
