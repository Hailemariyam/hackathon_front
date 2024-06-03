import 'package:flutter/material.dart';

class BuyerPage extends StatelessWidget {
  const BuyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: const Text("data"),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: GridView.builder(
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return const Card(
                margin: EdgeInsets.all(1),
                color: Colors.grey,
                child: GridTile(
                  footer: Text('name'),
                  child: Text(
                      'image'), //just for testing, will fill with image later
                ),
              );
            }));
  }
}
