import 'package:cofee/routes.dart';
import 'package:flutter/material.dart';

class CoffeCart extends StatelessWidget {
  final Map coffe;
  const CoffeCart({super.key, required this.coffe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xff212325),
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25), // Shadow color
              spreadRadius: 5, // How much it spreads
              blurRadius: 10, // Blur intensity
              offset: const Offset(0, 0),
              blurStyle: BlurStyle.normal // Shadow position
              ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.coffepage, arguments: coffe);
            },
            child: Container(
              height: 130,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/Espresso.png'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            coffe['name'],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 10),
          const Text(
            'best coffee',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${coffe['price']}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                iconSize: 20,
                onPressed: () {},
                constraints: const BoxConstraints(maxHeight: 35),
                icon: const Icon(Icons.add, color: Colors.white),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffe57734), // Background color
                  ),
                  shape: MaterialStateProperty.all(
                    const CircleBorder(), // Circular button
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
