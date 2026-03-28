import 'package:flutter/material.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/widgets.dart';

class FundsPage extends StatelessWidget {
  const FundsPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Funds App",
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
        ),
        backgroundColor: Colors.white,
        shadowColor: Color.fromARGB(255, 240, 240, 240),
      ),
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // WEB / DESKTOP
            return Row(
              children: const [
                Expanded(
                  flex: 2,
                  child: HistorySection(), // History
                ),
                Expanded(
                  flex: 2,
                  child: FundsSection(), // Funds
                ),
              ],
            );
          } else {
            // MOBILE
            return Column(
              children: const [
                Expanded(
                  child: HistorySection(), // History
                ),
                Expanded(
                  child: FundsSection(), // Funds
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
