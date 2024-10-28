import 'package:flutter/material.dart';

class AddProduit extends StatefulWidget {
  final Function(String) ajouterProduit;

  AddProduit(this.ajouterProduit);

  @override
  _AddProduitState createState() => _AddProduitState();
}

class _AddProduitState extends State<AddProduit> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); // Libère le controller pour éviter les fuites de mémoire
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un Produit'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Nom du produit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              widget.ajouterProduit(_controller.text);
              Navigator.of(context).pop();
            }
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
