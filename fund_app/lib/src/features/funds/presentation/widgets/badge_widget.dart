
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final double scale;
  const BadgeWidget({
    super.key,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: const AssetImage("assets/col.jpg"),
            radius: scale,
          ),
          const SizedBox(width: 5),
          Text(
            "COP",
            style: TextStyle(fontSize: scale),
          )
        ]),
      ),
    );
  }
}
