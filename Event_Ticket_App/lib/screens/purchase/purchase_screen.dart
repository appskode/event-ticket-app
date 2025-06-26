import 'package:event_ticket_app/screens/events/event_detail_screen.dart';
import 'package:event_ticket_app/screens/purchase/widget/purchase_form.dart';
import 'package:event_ticket_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_dialogs.dart';
import '../../core/models/event_model.dart';
import '../../core/providers/events_provider.dart';
import '../../core/providers/tickets_provider.dart';
import '../../core/services/api_service.dart';

class PurchaseScreen extends ConsumerStatefulWidget {
  final int eventId;

  const PurchaseScreen({super.key, required this.eventId});

  @override
  ConsumerState<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends ConsumerState<PurchaseScreen> {
  final Map<int, int> _ticketQuantities = {};
  bool _isLoading = false;
  bool _simulatePaymentSuccess = true; // Toggle for testing

  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(eventDetailProvider(widget.eventId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Select Tickets',
        hasBackButton: true,
      ),
      body: eventAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (event) => PurchaseForm(
          event: event,
          total: _calculateTotal(event.ticketTypes),
          ticketQuantities: _ticketQuantities,
          isLoading: _isLoading,
          simulatePaymentSuccess: _simulatePaymentSuccess,
          onPurchase: () => _purchaseTickets(event),
          onToggleSimulatePayment: (value) =>
              setState(() => _simulatePaymentSuccess = value),
          onIncrement: (ticketType) => ticketType.availableQuantity >
                      (_ticketQuantities[ticketType.id] ?? 0) &&
                  (_ticketQuantities[ticketType.id] ?? 0) < 10
              ? () => setState(() {
                    _ticketQuantities[ticketType.id] =
                        (_ticketQuantities[ticketType.id] ?? 0) + 1;
                  })
              : () {},
          onDecrement: (ticketType) =>
              (_ticketQuantities[ticketType.id] ?? 0) > 0
                  ? () => setState(() {
                        _ticketQuantities[ticketType.id] =
                            (_ticketQuantities[ticketType.id] ?? 0) - 1;
                        if (_ticketQuantities[ticketType.id] == 0) {
                          _ticketQuantities.remove(ticketType.id);
                        }
                      })
                  : () {},
        ),
      ),
    );
  }

  double _calculateTotal(List<TicketType> ticketTypes) {
    double total = 0;
    for (final ticketType in ticketTypes) {
      final quantity = _ticketQuantities[ticketType.id] ?? 0;
      total += ticketType.price * quantity;
    }
    return total;
  }

  Future<void> _purchaseTickets(Event event) async {
    setState(() => _isLoading = true);
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (!_simulatePaymentSuccess) {
        throw Exception('Payment failed. Please try again.');
      }

      final tickets = <Map<String, dynamic>>[];
      for (final entry in _ticketQuantities.entries) {
        if (entry.value > 0) {
          tickets.add({'ticket_type_id': entry.key, 'quantity': entry.value});
        }
      }

      await ref
          .read(apiServiceProvider)
          .purchaseTickets(widget.eventId, tickets);

      ref.read(ticketsProvider.notifier).loadTickets(refresh: true);

      ref.read(eventsProvider.notifier).loadEvents(refresh: true);

      if (mounted) {
        _showSuccessDialog();
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(e.toString());
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showSuccessDialog() {
    CustomDialogs.showSuccessDialog(
        context: context,
        title: 'Purchase Successful!',
        message:
            'Your tickets have been purchased successfully. You can view them in My Tickets.',
        buttonText: 'Go to My Tickets',
        navigateTo: '/mainScreen');
  }

  void _showErrorDialog(String error) {
    CustomDialogs.showErrorDialog(
        context: context,
        title: 'Purchase Failed',
        message: error,
        buttonText: 'OK');
  }
}
