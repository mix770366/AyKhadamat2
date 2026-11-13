import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext nameKey) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم والإدارة'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'أهلاً بك في لوحة الإدارة والتحكم بالنظام',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
