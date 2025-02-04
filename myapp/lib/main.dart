import 'package:flutter/material.dart';
import 'list.dart';
import 'QuoteCard.dart ';

void main() => runApp(const Test());

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Quote> quotes = [
    Quote(
      "Dhiaa",
      "Be yourself; evryone else is already taken ",
    ),
    Quote(
      "Zaki",
      "I have nothing to declare except my genius",
    ),
    Quote(
      "Ayoub",
      "the truth is rarely pure and never simple ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Awesome Quotes",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }))
            .toList(),
      ),
    ));
  }
}
