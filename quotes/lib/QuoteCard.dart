import 'package:flutter/material.dart';
import 'list.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final VoidCallback delete;
  const QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.fromLTRB(10, 16, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${quote.text}',
                style: TextStyle(
                  fontSize: 12.00,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                '${quote.author}',
                style: TextStyle(
                  fontSize: 14.00,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: delete,
                icon:const Icon(Icons.delete),
                label: const Text("Delete"),
              )
            ],
          ),
        ));
  }
}
