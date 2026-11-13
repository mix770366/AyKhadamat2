import 'package:flutter/material.dart';
import '../models/order_model.dart';

class AdminScreen extends StatelessWidget {
  final List<DeliveryOrder> orders;
  final Function(String, String) onUpdateStatus;

  const AdminScreen({super.key, required this.orders, required this.onUpdateStatus});

  @override
  Widget build(BuildContext context) {
    final totalRevenue = orders.fold<double>(0, (sum, item) => sum + item.price);
    final completedCount = orders.where((o) => o.status == 'تم التسليم').length;

    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الإدارة'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.indigo.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text('إجمالي الطلبات', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text('${orders.length}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text('المكتملة / الإيرادات', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text('$completedCount / ${totalRevenue.toInt()} ر.ي', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('سجل العمليات المباشر', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final o = orders[index];
                  return Card(
                    child: ListTile(
                      title: Text('${o.id} - ${o.customerName}'),
                      subtitle: Text('${o.serviceType} | ${o.price.toInt()} ريال'),
                      trailing: Chip(label: Text(o.status)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
