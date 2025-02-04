import 'package:app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text('Cart',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'corben',
              fontSize: 24,
            )),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<CartModel>(builder: (context, cart, child) {
            return ListView(
              children: [
                for (var it in cart.selectedItems)
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListTile(
                      title: Text(
                        it.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      trailing:
                          Consumer<CartModel>(builder: (context, cart, child) {
                        return IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            cart.removeItem(it);
                          },
                        );
                      }),
                    ),
                  )
              ],
            );
          })),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CartModel>(builder: (context, cart, child) {
                  return Text(
                    '${cart.total_price}\$',
                    style: TextStyle(
                      fontFamily: 'corben',
                      fontSize: 30,
                    ),
                  );
                }),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'BUY',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
