import 'package:flutter/material.dart';
import 'package:olearis_test/view/home/widget/grid_item.dart';

class CustomGridView extends StatelessWidget {
  final List<String> items;

  const CustomGridView({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 4,
      children: items
          .asMap()
          .entries
          .map((entry) => GridItem(
                index: entry.key,
                item: entry.value,
              ))
          .toList(),
    );
  }
}
