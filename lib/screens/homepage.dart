import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PhamaChain')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _myController,
              decoration: InputDecoration(border: OutlineInputBorder(),suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){},),label: Text("Enter a product")),

            ),
          )
        ],
      ),
    );
  }
}
