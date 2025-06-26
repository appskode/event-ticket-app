import 'package:flutter/material.dart';

import '../../../core/models/event_model.dart';

class TicketSelector extends StatelessWidget {
  final TicketType ticketType;
  final int quantity;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const TicketSelector({
    super.key,
    required this.ticketType,
    required this.quantity,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticketType.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '\$${ticketType.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: CircleAvatar(
                  radius: 14,
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: CircleAvatar(
                  radius: 14,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
