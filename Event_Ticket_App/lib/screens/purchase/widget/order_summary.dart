import 'package:flutter/material.dart';

import '../../../core/models/event_model.dart';

class OrderSummary extends StatelessWidget {
  final List<TicketType> ticketTypes;
  final Map<int, int> ticketQuantities;
  final double total;

  const OrderSummary({
    super.key,
    required this.ticketTypes,
    required this.ticketQuantities,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...ticketTypes.map((ticketType) {
            final quantity = ticketQuantities[ticketType.id] ?? 0;
            if (quantity > 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${ticketType.name} x$quantity'),
                    Text(
                        '\$${((ticketType.price * quantity).toStringAsFixed(2))}'),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          }),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service Fee',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '\$${(total * 0.1).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Processing Fee',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '\$${(total * 0.05).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${(total * 1.15).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4285F4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
