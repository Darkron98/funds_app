import 'package:flutter/material.dart';

void customSnackbar(
  BuildContext context, {
  required String message,
  required String type,
  String? subtittle,
  bool? success,
}) {
  Color color = type == 'ok'
      ? const Color.fromARGB(255, 39, 190, 129)
      : const Color.fromARGB(255, 242, 76, 101);
  Color iconColor = type == 'ok'
      ? const Color.fromARGB(255, 0, 255, 153)
      : const Color.fromARGB(255, 236, 134, 149);
  IconData icon = type == 'ok' ? Icons.beenhere : Icons.warning;

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        elevation: 0,
        width: 400,
        content: SafeArea(
          child: SizedBox(
            height: 100,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [color, iconColor])),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              message,
                              style: const TextStyle(
                                //fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtittle != null
                                ? Text(
                                    subtittle,
                                    style: const TextStyle(
                                      //fontFamily: 'SourceSansPro',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 10,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 50,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 15,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                    ),
                    color: Colors.white,
                    onPressed: () =>
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  ),
                ),
              ],
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 2,
          right: 2,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
      ),
    );
}
