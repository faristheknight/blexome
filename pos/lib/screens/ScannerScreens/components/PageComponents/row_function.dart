import 'package:flutter/material.dart';

class TableRowWidget extends StatelessWidget {
  final String name;
  final String id;
  final String quantity;
  final String sellingPrice;
  final Function(String id) onUpdate;
  final Function(String id) onDelete;

  const TableRowWidget({super.key, 
    required this.name,
    required this.id,
    required this.quantity,
    required this.sellingPrice,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(name)),
        Expanded(child: Text(quantity)),
        Expanded(child: Text(sellingPrice)),
        IconButton(
          icon: const Icon(Icons.update),
          onPressed: () => onUpdate(id),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => onDelete(id),
        ),
      ],
    );
  }
}
