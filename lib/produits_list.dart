import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<Map<String, dynamic>> produits = [
    {'nomProduit': 'Produit 1', 'selectionne': false},
    {'nomProduit': 'Produit 2', 'selectionne': false},
    {'nomProduit': 'Produit 3', 'selectionne': false},
    {'nomProduit': 'Produit 4', 'selectionne': false},
  ];

  void ajouterProduit(String nomProduit) {
    setState(() {
      produits.add({'nomProduit': nomProduit, 'selectionne': false});
    });
  }

  void supprimerProduit(String nomProduit) {
    setState(() {
      produits.removeWhere((produit) => produit['nomProduit'] == nomProduit);
    });
  }

  void supprimerSelection() {
    setState(() {
      produits.removeWhere((produit) => produit['selectionne']);
    });
  }

  void changerSelection(int index, bool selectionne) {
    setState(() {
      produits[index]['selectionne'] = selectionne;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: supprimerSelection,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: produits[index]['nomProduit'],
            selProduit: produits[index]['selectionne'],
            onChanged: (val) => changerSelection(index, val!),
            delProduit: () => supprimerProduit(produits[index]['nomProduit']),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddProduit(ajouterProduit),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
