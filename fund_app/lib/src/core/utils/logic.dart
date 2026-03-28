import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Retorna un tamaño de fuente responsive basado en el ancho de pantalla.
///
/// - Define un breakpoint simple (800px) para diferenciar entre
///    web/desktop y mobile.
double responsiveSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;

  if (width > 800) return 24;
  return 16;
}

/// Formatea una fecha en un string legible en español.
///
/// - Convierte el mes numerico a su representacion de texto.
/// - Retorna el formato: día de mes (ej: "28 de marzo").
String formatDate(DateTime date) {
  const months = [
    'enero',
    'febrero',
    'marzo',
    'abril',
    'mayo',
    'junio',
    'julio',
    'agosto',
    'septiembre',
    'octubre',
    'noviembre',
    'diciembre'
  ];

  final day = date.day;
  final month = months[date.month - 1];

  return '$day de $month';
}

/// Formatea un valor numerico pare separar las cifras.
///
/// - Utiliza NumberFormat con locale es_CO.
/// - Aplica separadores de miles (ej: 1,000,000).
String formatCurrency(num value) {
  final formatter = NumberFormat('#,##0', 'es_CO');
  return formatter.format(value);
}

/// Normaliza textos reemplazando separadores por espacios.
///
/// - Sustituye guiones ( - ) y guiones bajos ( _ ) por espacios.
String formatText(String value) {
  return value.replaceAll(RegExp(r'[-_]'), ' ');
}
