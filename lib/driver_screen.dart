import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({Key? key}) : super(key: key);

  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  final List> _availableOrders = [
    {'title': 'طلب توصيل طلبات مطعم', 'location': 'إب - الحي الراقي'},
    {'title': 'طلب توصيل أوراق رسمية', 'location': 'صنعاء - السبعين'},
  ];

  void _acceptOrder(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم قبول الطلب: ${_availableOrders[index]['title']} بنجاح!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة المندوب (الطلبات المتاحة)'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: _availableOrders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.delivery_dining, color: Colors.green, size: 30),
              title: Text(_availableOrders[index]['title']!),
              subtitle: Text('الموقع: ${_availableOrders[index]['location']}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => _acceptOrder(index),
                child: const Text('قبول', style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}
