import 'package:flutter/material.dart';

import 'date_selector_widget.dart';

class EventFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final TextEditingController imageUrlController;
  final DateTime? eventDate;
  final DateTime? saleStartDate;
  final DateTime? saleEndDate;
  final bool allowCancellation;
  final int cancellationHours;
  final Function(DateTime) onEventDateSelected;
  final Function(DateTime) onSaleStartDateSelected;
  final Function(DateTime) onSaleEndDateSelected;
  final Function(bool?) onAllowCancellationChanged;
  final Function(String) onCancellationHoursChanged;

  const EventFormWidget({
    super.key,
    required this.nameController,
    required this.descriptionController,
    required this.locationController,
    required this.imageUrlController,
    required this.eventDate,
    required this.saleStartDate,
    required this.saleEndDate,
    required this.allowCancellation,
    required this.cancellationHours,
    required this.onEventDateSelected,
    required this.onSaleStartDateSelected,
    required this.onSaleEndDateSelected,
    required this.onAllowCancellationChanged,
    required this.onCancellationHoursChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Event Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Event Name*',
            border: OutlineInputBorder(),
          ),
          validator: (value) =>
              value?.isEmpty == true ? 'Please enter event name' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description*',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
          validator: (value) =>
              value?.isEmpty == true ? 'Please enter description' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: locationController,
          decoration: const InputDecoration(
            labelText: 'Location*',
            border: OutlineInputBorder(),
          ),
          validator: (value) =>
              value?.isEmpty == true ? 'Please enter location' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: imageUrlController,
          decoration: const InputDecoration(
            labelText: 'Image URL (optional)',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),
        DateSelectorWidget(
          label: 'Event Date*',
          selectedDate: eventDate,
          onDateSelected: onEventDateSelected,
        ),
        const SizedBox(height: 16),
        DateSelectorWidget(
          label: 'Sale Start Date*',
          selectedDate: saleStartDate,
          onDateSelected: onSaleStartDateSelected,
        ),
        const SizedBox(height: 16),
        DateSelectorWidget(
          label: 'Sale End Date*',
          selectedDate: saleEndDate,
          onDateSelected: onSaleEndDateSelected,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Checkbox(
              value: allowCancellation,
              onChanged: onAllowCancellationChanged,
            ),
            const Text('Allow ticket cancellation'),
          ],
        ),
        if (allowCancellation) ...[
          const SizedBox(height: 16),
          TextFormField(
            initialValue: cancellationHours.toString(),
            decoration: const InputDecoration(
              labelText: 'Cancellation hours before event',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: onCancellationHoursChanged,
          ),
        ],
      ],
    );
  }
}
