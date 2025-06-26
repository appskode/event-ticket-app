import 'package:event_ticket_app/screens/purchase/widget/ticket_selector.dart';
import 'package:flutter/material.dart';

import '../../../core/models/event_model.dart';
import '../../../widget/custome_text_button.dart';
import 'order_summary.dart';

class PurchaseForm extends StatelessWidget {
  final Event event;
  final double total;
  final Map<int, int> ticketQuantities;
  final bool isLoading;
  final bool simulatePaymentSuccess;
  final VoidCallback? onPurchase;
  final ValueChanged<bool> onToggleSimulatePayment;
  final VoidCallback Function(TicketType) onIncrement;
  final VoidCallback Function(TicketType) onDecrement;

  const PurchaseForm({
    super.key,
    required this.event,
    required this.total,
    required this.ticketQuantities,
    required this.isLoading,
    required this.simulatePaymentSuccess,
    this.onPurchase,
    required this.onToggleSimulatePayment,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'General Pass',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Access to all areas.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 13),
            ...event.ticketTypes.map(
              (ticketType) => TicketSelector(
                ticketType: ticketType,
                quantity: ticketQuantities[ticketType.id] ?? 0,
                onIncrement: onIncrement(ticketType),
                onDecrement: onDecrement(ticketType),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text('Simulate Payment Success:'),
                const SizedBox(width: 8),
                Switch(
                  value: simulatePaymentSuccess,
                  onChanged: onToggleSimulatePayment,
                ),
              ],
            ),
            const SizedBox(height: 24),
            OrderSummary(
              ticketTypes: event.ticketTypes,
              ticketQuantities: ticketQuantities,
              total: total,
            ),
            SizedBox(height: 20),
            CustomTextButton(
              text: 'Purchase Tickets',
              onPressed: (total > 0 && !isLoading) ? onPurchase! : () {},
              backgroundColor: const Color(0xFF4285F4),
              textColor: Colors.white,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
