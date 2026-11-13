import 'package:flutter/material.dart';
import '../models/order_model.dart';

class DriverScreen extends StatefulWidget {
  final List<DeliveryOrder> orders;
  final Function(String, String) onUpdateStatus;

  const DriverScreen({super.key, required this.orders, required this.onUpdateStatus});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بوابة المندوب'), backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
          final order = widget.orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${order.id} - ${order.customerName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Chip(label: Text(order.status)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('الخدمة: ${order.serviceType}'),
                  Text('الاستلام: ${order.pickupLocation}'),
                  Text('التسليم: ${order.dropoffLocation}'),
                  Text('الأجرة: ${order.price.toInt()} ريال'),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (order.status == 'قيد الانتظار')
                        ElevatedButton(
                          onPressed: () {
                            widget.onUpdateStatus(order.id, 'جاري التوصيل');
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800, foregroundColor: Colors.white),
                          child: const Text('قبول الطلب'),
                        ),
                      if (order.status == 'جاري التوصيل')
                        ElevatedButton(
                          onPressed: () {
                            widget.onUpdateStatus(order.id, 'تم التسليم');
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                          child: const Text('تأكيد التسليم'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
