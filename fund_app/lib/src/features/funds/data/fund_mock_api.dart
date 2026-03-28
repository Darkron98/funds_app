import '../../../core/models/models.dart';
import 'dart:async';

class FundsApiMock {
  Future<List<Fund>> getFunds() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate latency

    return [
      Fund(
        id: 1,
        name: "FPV_BTG_PACTUAL_RECAUDADORA",
        minAmount: 75000,
        category: "FPV",
      ),
      Fund(
        id: 2,
        name: "FPV_BTG_PACTUAL_ECOPETROL",
        minAmount: 125000,
        category: "FIC",
      ),
      Fund(
        id: 3,
        name: "DEUDAPRIVADA",
        minAmount: 50000,
        category: "FIC",
      ),
      Fund(
        id: 4,
        name: "FDO-ACCIONES",
        minAmount: 250000,
        category: "FIC",
      ),
      Fund(
        id: 5,
        name: "FPV_BTG_PACTUAL_DINAMICA",
        minAmount: 1000000,
        category: "FPV",
      ),
    ];
  }
}
