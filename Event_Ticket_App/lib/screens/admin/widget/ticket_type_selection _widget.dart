import 'package:event_ticket_app/screens/admin/widget/ticket_card_widget.dart';
import 'package:flutter/material.dart';

class TicketTypesSectionWidget extends StatelessWidget {
  final List<Map<String, dynamic>> ticketTypes;
  final Function(Map<String, dynamic>) onAddTicketType;
  final Function(int) onRemoveTicketType;

  const TicketTypesSectionWidget({
    super.key,
    required this.ticketTypes,
    required this.onAddTicketType,
    required this.onRemoveTicketType,
  });

  void _showAddTicketDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final priceController = TextEditingController();
    final quantityController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Ticket Type'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Ticket Name*',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price*',
                  border: OutlineInputBorder(),
                  prefixText: '\$',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  labelText: 'Total Quantity*',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty &&
                  quantityController.text.isNotEmpty) {
                onAddTicketType({
                  'name': nameController.text,
                  'description': descriptionController.text.isEmpty
                      ? null
                      : descriptionController.text,
                  'price': double.tryParse(priceController.text) ?? 0.0,
                  'quantity': int.tryParse(quantityController.text) ?? 0,
                });
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Ticket Types',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _showAddTicketDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Ticket'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (ticketTypes.isEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: const Center(
              child: Text(
                'No ticket types added yet.\nClick "Add Ticket" to get started.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        else
          ...List.generate(
            ticketTypes.length,
            (index) => TicketTypeCardWidget(
              ticketType: ticketTypes[index],
              index: index,
              onRemove: () => onRemoveTicketType(index),
            ),
          ),
      ],
    );
  }
}
