import 'package:app/models/cart.dart';
import 'package:app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  Catalog({super.key});

  final myList = CatalogModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text('Catalog',
            style: TextStyle(
              fontFamily: 'corben',
              fontSize: 24,
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
              );
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return ListItem(
            item: myList.getById(index),
          );
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Item item;

  ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: item.color,
          ),
          Expanded(
            child: ListTile(
              title: Text(item.name),
              trailing: Consumer<CartModel>(builder: (context, cart, child) {
                if (!cart.selectedItems.contains(item)) {
                  return TextButton(
                      onPressed: () {
                        cart.addItem(item);
                      },
                      child: const Text(
                        "ADD",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ));
                } else {
                  return Icon(Icons.check);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
