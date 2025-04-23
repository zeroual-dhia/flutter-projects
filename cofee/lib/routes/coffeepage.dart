import 'package:cofee/models/coffee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Coffeepage extends StatelessWidget {
  final Map coffe;
  const Coffeepage({super.key, required this.coffe});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => CoffeProvider(),
      child: Scaffold(
          body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Espresso.png'),
                            fit: BoxFit.contain))),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'BEST COFEE',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), letterSpacing: 3),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${coffe['name']}',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 30, letterSpacing: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 2,
                              style: BorderStyle.solid,
                              color: Colors.white.withOpacity(0.2))),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              CupertinoIcons.minus,
                              color: Colors.white,
                            ),
                            Text(
                              '2',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Icon(CupertinoIcons.minus, color: Colors.white),
                          ]),
                    ),
                    Text(
                      '\$${coffe['price']}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Coffee is a major source of antioxidants in the diet , it has many helth benefits",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 16),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Volume : 60 ml ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(18),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 50, 54, 56),
                            borderRadius: BorderRadius.circular(18)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        child: const Text(
                          "Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                          color: const Color(0xffe57734),
                          borderRadius: BorderRadius.circular(18)),
                      child: Consumer<CoffeProvider>(
                        builder: (context, coffe, child) {
                          return InkWell(
                            onTap: () {
                              coffe.add_to_favorites();
                            },
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 35,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
