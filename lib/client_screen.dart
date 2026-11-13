import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final List<String> _orders = [
    'طلب توصيل طرد - شارع المحافظة',
    'طلب خدمة صيانة منزلية'
  ];

  void _addNewOrder() {
    setState(() {
      _orders.add('طلب جديد رقم ${_orders.length + 1}');
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت إضافة الطلب بنجاح!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوابة العميل - الطلبات'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag, color: Colors.blue),
              title: Text(_orders[index]),
              subtitle: const Text(
                'الحالة: قيد الانتظار',
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewOrder,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        tooltip: 'إضافة طلب جديد',
      ),
    );
  }
}
