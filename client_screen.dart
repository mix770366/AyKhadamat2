import 'package:flutter/material.dart';
import '../models/order_model.dart';

class ClientScreen extends StatefulWidget {
  final List<DeliveryOrder> orders;
  final Function(DeliveryOrder) onAddOrder;

  const ClientScreen({super.key, required this.orders, required this.onAddOrder});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final _nameController = TextEditingController();
  final _pickupController = TextEditingController();
  final _dropoffController = TextEditingController();
  String _selectedService = 'توصيل طلبات سريعة';

  void _submitOrder() {
    if (_nameController.text.isEmpty || _pickupController.text.isEmpty || _dropoffController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى تعبئة جميع الحقول المطلوبة')),
      );
      return;
    }

    final newOrder = DeliveryOrder(
      id: 'ORD-${100 + widget.orders.length + 1}',
      customerName: _nameController.text,
      pickupLocation: _pickupController.text,
      dropoffLocation: _dropoffController.text,
      serviceType: _selectedService,
      price: 1500,
      status: 'قيد الانتظار',
    );

    widget.onAddOrder(newOrder);
    _nameController.clear();
    _pickupController.clear();
    _dropoffController.clear();
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم إرسال طلبك بنجاح!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بوابة العميل'), backgroundColor: Colors.teal, foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('إنشاء طلب جديد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'اسم العميل', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: _selectedService,
              decoration: const InputDecoration(labelText: 'نوع الخدمة', border: OutlineInputBorder()),
              items: ['توصيل طلبات سريعة', 'نقل طرد', 'مقاضي منزلية', 'مشوار خاص']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedService = val!),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pickupController,
              decoration: const InputDecoration(labelText: 'موقع الاستلام', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _dropoffController,
              decoration: const InputDecoration(labelText: 'موقع التسليم', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _submitOrder,
              icon: const Icon(Icons.send),
              label: const Text('إرسال الطلب الآن'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const Divider(height: 32),
            const Text('طلباتي السابقة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...widget.orders.map((o) => Card(
                  child: ListTile(
                    title: Text('${o.serviceType} (${o.id})'),
                    subtitle: Text('من: ${o.pickupLocation} -> إلى: ${o.dropoffLocation}'),
                    trailing: Chip(label: Text(o.status)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
