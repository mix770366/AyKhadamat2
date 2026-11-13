import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({Key? key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final List<String> _orders = ['طلب توصيل طرد - شارع المحافظة', 'طلب خدمة صيانة منزلية'];

  void _addNewOrder() {
    setState(() {
      _orders.add('طلب جديد رقم ${_orders.length + 1}');
    });
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
              subtitle: const StatusBadge(status: 'قيد الانتظار'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewOrder,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
        tooltip: 'إضافة طلب جديد',
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'الحالة: $status',
      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
    );
  }
}
