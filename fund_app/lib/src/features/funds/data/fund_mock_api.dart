/// Mock API que simula un consumo de backend para fondos y transacciones.
///
/// Esta clase actua como una capa de datos en memoria, permitiendo:
/// - Obtener la lista de fondos disponibles
/// - Actualizar el estado de suscripción de un fondo
/// - Registrar y consultar transacciones
///
/// Se utilizan delays artificiales para simular latencia de red.
import '../../../core/models/models.dart';
import 'dart:async';

class FundsApiMock {
  /// Lista interna de fondos simulados.
  ///
  /// Se mantiene en memoria y representa la fuente de datos principal
  /// para las operaciones de la aplicación.
  final List<Fund> _funds = [
    Fund(
      id: 1,
      name: "FPV_BTG_PACTUAL_RECAUDADORA",
      minAmount: 75000,
      category: "FPV",
      subscribed: false,
    ),
    Fund(
      id: 2,
      name: "FPV_BTG_PACTUAL_ECOPETROL",
      minAmount: 125000,
      category: "FIC",
      subscribed: false,
    ),
    Fund(
      id: 3,
      name: "DEUDAPRIVADA",
      minAmount: 50000,
      category: "FIC",
      subscribed: false,
    ),
    Fund(
      id: 4,
      name: "FDO-ACCIONES",
      minAmount: 250000,
      category: "FIC",
      subscribed: false,
    ),
    Fund(
      id: 5,
      name: "FPV_BTG_PACTUAL_DINAMICA",
      minAmount: 100000,
      category: "FPV",
      subscribed: false,
    ),
  ];

  /// Lista interna de transacciones.
  ///
  /// Inicialmente vacía, se va llenando a medida que el usuario
  /// realiza operaciones de suscripción o cancelación.
  final List<Transaction> _transactions = [];

  /// Obtiene la lista de fondos disponibles.
  ///
  /// Simula una llamada HTTP con latencia.
  /// Retorna la lista actual de fondos en memoria.
  Future<List<Fund>> getFunds() async {
    await Future.delayed(const Duration(seconds: 1));
    return _funds;
  }

  /// Actualiza el estado de suscripción de un fondo.
  ///
  /// [id]: id del fondo a modificar
  /// [subscribed]: nuevo estado de suscripcion
  ///
  /// Lanza una excepcion si el fondo no existe.
  Future<void> updateSubscription({
    required int id,
    required bool subscribed,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final index = _funds.indexWhere((fund) => fund.id == id);

    if (index == -1) {
      throw Exception('Fund not found');
    }

    _funds[index] = _funds[index].copyWith(
      subscribed: subscribed,
    );
  }

  /// Obtiene el historial de transacciones.
  ///
  /// Retorna las transacciones almacenadas en memoria,
  /// ordenadas por inserción (más recientes primero).
  Future<List<Transaction>> getTransactions() async {
    await Future.delayed(const Duration(seconds: 1));
    return _transactions;
  }

  /// Inserta una nueva transacción en el historial.
  ///
  /// La transacción se agrega al inicio de la lista para
  /// mantener un orden descendente por fecha (más reciente primero).
  Future<void> insertTransaction(Transaction transaction) async {
    await Future.delayed(const Duration(seconds: 1));

    _transactions.insert(0, transaction);
  }
}
