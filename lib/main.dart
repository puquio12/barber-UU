import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Materiales de Construcción',
    home: Scaffold(
      appBar: AppBar(
        title: Text('Materiales de Construcción'),
      ),
      body: MaterialStore(),
    ),
  ));
}

class MaterialStore extends StatefulWidget {
  @override
  _MaterialStoreState createState() => _MaterialStoreState();
}

class _MaterialStoreState extends State<MaterialStore> {
  List<String> cartItems = [];

  void addToCart(String item) {
    setState(() {
      cartItems.add(item);
    });
  }

  void removeFromCart(String item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MaterialSection(
          sectionTitle: 'Materiales de Construcción',
          items: [
            MaterialItem(
              name: 'Cemento',
              price: 10.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
            MaterialItem(
              name: 'Ladrillos',
              price: 0.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
            MaterialItem(
              name: 'Arena',
              price: 5.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
          ],
        ),
        MaterialSection(
          sectionTitle: 'Herramientas',
          items: [
            MaterialItem(
              name: 'Martillo',
              price: 8.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
            MaterialItem(
              name: 'Destornillador',
              price: 5.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
            MaterialItem(
              name: 'Sierra',
              price: 15.99,
              onAddToCart: addToCart,
              onRemoveFromCart: removeFromCart,
            ),
          ],
        ),
        ShoppingCart(cartItems: cartItems),
      ],
    );
  }
}

class MaterialSection extends StatelessWidget {
  final String sectionTitle;
  final List<MaterialItem> items;

  MaterialSection({required this.sectionTitle, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            sectionTitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: items,
        ),
      ],
    );
  }
}

class MaterialItem extends StatelessWidget {
  final String name;
  final double price;
  final Function(String) onAddToCart;
  final Function(String) onRemoveFromCart;

  MaterialItem({
    required this.name,
    required this.price,
    required this.onAddToCart,
    required this.onRemoveFromCart,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('\$${price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          onAddToCart(name);
        },
      ),