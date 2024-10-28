import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?) onChanged;
  final VoidCallback delProduit;

  const ProduitBox({
    required this.nomProduit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Slidable(
        key: ValueKey(nomProduit), // Clé unique
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                if (delProduit != null) delProduit();
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Supprimer',
            ),
          ],
        ),
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: selProduit,
                    onChanged: onChanged != null ? onChanged : null,
                  ),
                  Text(nomProduit),
                ],
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: delProduit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
