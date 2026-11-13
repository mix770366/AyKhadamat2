import 'package:flutter/material.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة المندوب (الكابتن)'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في بوابة المندوب - استقبال الطلبات والتوصيل',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
