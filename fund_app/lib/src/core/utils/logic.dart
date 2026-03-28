import 'package:flutter/material.dart';

double responsiveSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width > 800) return 24;
  return 16;
}
