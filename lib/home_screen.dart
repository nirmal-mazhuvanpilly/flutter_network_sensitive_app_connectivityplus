import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Network sensitive app"),
      ),
      body: const Center(
        child: Text(
          "Connection Established",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
