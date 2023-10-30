import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final int index;
  final String item;

  const GridItem({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Center(
        child: Text(
          '$item $index',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
