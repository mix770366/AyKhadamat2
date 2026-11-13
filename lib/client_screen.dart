import 'package:flutter/material.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة العميل'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في بوابة العميل - طلبات الخدمات',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
