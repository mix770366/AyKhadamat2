import 'package:flutter/material.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة المندوب'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في بوابة المندوب',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
