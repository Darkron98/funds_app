import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/custom_snackbar.dart';
import 'package:fund_app/src/features/funds/presentation/widgets/widgets.dart';

import '../../../bloc/funds_bloc.dart';

/// Pagina principal que actua como layout para la UI.
/// - Implementa diseño responsive usando LayoutBuilder:
///   - En pantallas web/desktop, organiza el contenido en un Row
///     mostrando HistorySection y FundsSection lado a lado.
///   - En pantallas mobile, utiliza un Column
///     apilando ambas secciones verticalmente.
class FundsPage extends StatelessWidget {
  const FundsPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FundsBloc, FundsState>(
      listener: (context, state) {
        if ((state.transactionComplete ?? false) && state.error == null) {
          customSnackbar(
            context,
            message: 'Transaccion completada',
            type: 'ok',
          );
          BlocProvider.of<FundsBloc>(context)
              .add(SendNotification('user@mail.com'));
        } else if ((state.transactionComplete ?? false) &&
            state.error != null) {
          customSnackbar(
            context,
            message: state.error ?? 'Error no controlado',
            type: 'err',
          );
        }
        if (state.successMessage != null) {
          customSnackbar(
            context,
            message: state.successMessage ?? 'Operacion exitosa',
            type: 'ok',
          );
        }
        if (state.error != null) {
          customSnackbar(
            context,
            message: state.error ?? 'Error no controlado',
            type: 'err',
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Funds App",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
          backgroundColor: Colors.white,
          shadowColor: const Color.fromARGB(255, 240, 240, 240),
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: VerticalDivider(),
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
                    flex: 2,
                    child: HistorySection(), // History
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(),
                  ),
                  Expanded(
                    flex: 2,
                    child: FundsSection(), // Funds
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
