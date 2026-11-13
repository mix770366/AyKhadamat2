class DeliveryOrder {
  final String id;
  final String customerName;
  final String pickupLocation;
  final String dropoffLocation;
  final String serviceType;
  final double price;
  String status;

  DeliveryOrder({
    required this.id,
    required this.customerName,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.serviceType,
    required this.price,
    required this.status,
  });
}
