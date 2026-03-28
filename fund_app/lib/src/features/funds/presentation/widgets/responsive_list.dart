import 'package:flutter/material.dart';

class ResponsiveList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final String message;
  const ResponsiveList(
      {super.key,
      required this.items,
      required this.itemBuilder,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
            child: Text(message),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return itemBuilder(context, item, index);
            },
          );
  }
}
