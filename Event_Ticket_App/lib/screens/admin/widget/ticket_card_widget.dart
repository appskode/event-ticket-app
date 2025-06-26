import 'package:flutter/material.dart';

class TicketTypeCardWidget extends StatelessWidget {
  final Map<String, dynamic> ticketType;
  final int index;
  final VoidCallback onRemove;

  const TicketTypeCardWidget({
    super.key,
    required this.ticketType,
    required this.index,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ticketType['name'] ?? 'Unnamed Ticket',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            if (ticketType['description']?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              Text(ticketType['description']),
            ],
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                    'Price: \$${ticketType['price']?.toStringAsFixed(2) ?? '0.00'}'),
                const SizedBox(width: 24),
                Text('Quantity: ${ticketType['quantity'] ?? 0}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
