import 'package:flutter/material.dart';
import 'models/order_model.dart';
import 'screens/client_screen.dart';
import 'screens/driver_screen.dart';
import 'screens/admin_screen.dart';

void main() {
  runApp(const AyKhadamatApp());
}

class AyKhadamatApp extends StatelessWidget {
  const AyKhadamatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أي خدمات - AyKhadamat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const RoleSelectorScreen(),
    );
  }
}

class RoleSelectorScreen extends StatefulWidget {
  const RoleSelectorScreen({super.key});

  @override
  State<RoleSelectorScreen> createState() => _RoleSelectorScreenState();
}

class _RoleSelectorScreenState extends State<RoleSelectorScreen> {
  final List<DeliveryOrder> _orders = [
    DeliveryOrder(
      id: 'ORD-101',
      customerName: 'أحمد محمد',
      pickupLocation: 'شارع تعز - جولة العدين',
      dropoffLocation: 'حي المحافظة - إب',
      serviceType: 'توصيل طلبات سريعة',
      price: 1500,
      status: 'قيد الانتظار',
    ),
    DeliveryOrder(
      id: 'ORD-102',
      customerName: 'سالم عبدالله',
      pickupLocation: 'السبعين - صنعاء',
      dropoffLocation: 'حدة - صنعاء',
      serviceType: 'نقل طرد',
      price: 2500,
      status: 'جاري التوصيل',
    ),
  ];

  void _addOrder(DeliveryOrder order) {
    setState(() {
      _orders.insert(0, order);
    });
  }

  void _updateOrderStatus(String id, String newStatus) {
    setState(() {
      final index = _orders.indexWhere((o) => o.id == id);
      if (index != -1) {
        _orders[index].status = newStatus;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أي خدمات - AyKhadamat', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.delivery_dining, size: 80, color: Colors.teal),
            const SizedBox(height: 16),
            const Text(
              'مرحباً بك في منصة أي خدمات',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'اختر البوابة للدخول إلى النظام',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildRoleCard(
              context,
              title: 'بوابة العميل',
              subtitle: 'اطلب خدمة توصيل أو مشوار بسهولة',
              icon: Icons.person,
              color: Colors.teal,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ClientScreen(orders: _orders, onAddOrder: _addOrder),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildRoleCard(
              context,
              title: 'بوابة المندوب (الكابتن)',
              subtitle: 'استقبال الطلبات وتحديث حالة التوصيل',
              icon: Icons.motorcycle,
              color: Colors.orange.shade800,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DriverScreen(orders: _orders, onUpdateStatus: _updateOrderStatus),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildRoleCard(
              context,
              title: 'لوحة الإدارة والتحكم',
              subtitle: 'مراقبة جميع العمليات والإحصائيات',
              icon: Icons.admin_panel_settings,
              color: Colors.indigo,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminScreen(orders: _orders, onUpdateStatus: _updateOrderStatus),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          radius: 26,
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
