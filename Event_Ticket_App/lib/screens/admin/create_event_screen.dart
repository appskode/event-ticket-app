import 'package:event_ticket_app/screens/admin/widget/event_form_widget.dart';
import 'package:event_ticket_app/screens/admin/widget/ticket_type_selection%20_widget.dart';
import 'package:event_ticket_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers/events_provider.dart';
import '../../core/services/api_service.dart';

class CreateEventScreen extends ConsumerStatefulWidget {
  const CreateEventScreen({super.key});

  @override
  ConsumerState<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends ConsumerState<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageUrlController = TextEditingController();

  DateTime? _eventDate;
  DateTime? _saleStartDate;
  DateTime? _saleEndDate;
  bool _allowCancellation = true;
  int _cancellationHours = 24;
  bool _isLoading = false;

  final List<Map<String, dynamic>> _ticketTypes = [];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateEventDate(DateTime date) => setState(() => _eventDate = date);
  void _updateSaleStartDate(DateTime date) =>
      setState(() => _saleStartDate = date);
  void _updateSaleEndDate(DateTime date) => setState(() => _saleEndDate = date);
  void _updateAllowCancellation(bool? value) =>
      setState(() => _allowCancellation = value ?? false);
  void _updateCancellationHours(String value) =>
      _cancellationHours = int.tryParse(value) ?? 24;
  void _addTicketType(Map<String, dynamic> ticketType) =>
      setState(() => _ticketTypes.add(ticketType));
  void _removeTicketType(int index) =>
      setState(() => _ticketTypes.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Create Event',
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EventFormWidget(
                      nameController: _nameController,
                      descriptionController: _descriptionController,
                      locationController: _locationController,
                      imageUrlController: _imageUrlController,
                      eventDate: _eventDate,
                      saleStartDate: _saleStartDate,
                      saleEndDate: _saleEndDate,
                      allowCancellation: _allowCancellation,
                      cancellationHours: _cancellationHours,
                      onEventDateSelected: _updateEventDate,
                      onSaleStartDateSelected: _updateSaleStartDate,
                      onSaleEndDateSelected: _updateSaleEndDate,
                      onAllowCancellationChanged: _updateAllowCancellation,
                      onCancellationHoursChanged: _updateCancellationHours,
                    ),
                    const SizedBox(height: 32),
                    TicketTypesSectionWidget(
                      ticketTypes: _ticketTypes,
                      onAddTicketType: _addTicketType,
                      onRemoveTicketType: _removeTicketType,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed:
                      _isLoading || _ticketTypes.isEmpty ? null : _createEvent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4285F4),
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Create Event',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createEvent() async {
    if (!_formKey.currentState!.validate()) return;
    if (_eventDate == null || _saleStartDate == null || _saleEndDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select all required dates')),
      );
      return;
    }
    if (_ticketTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one ticket type')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final eventData = {
        'name': _nameController.text.trim(),
        'description': _descriptionController.text.trim(),
        'location': _locationController.text.trim(),
        'image_url': _imageUrlController.text.trim().isEmpty
            ? null
            : _imageUrlController.text.trim(),
        'event_date': _eventDate!.toIso8601String(),
        'sale_start_date': _saleStartDate!.toIso8601String(),
        'sale_end_date': _saleEndDate!.toIso8601String(),
        'allow_cancellation': _allowCancellation,
        'cancellation_hours_before':
            _allowCancellation ? _cancellationHours : null,
      };

      final success =
          await ref.read(eventsProvider.notifier).createEvent(eventData);

      if (success) {
        final events = ref.read(eventsProvider).events;
        if (events.isNotEmpty) {
          final createdEvent = events.first;

          for (final ticketType in _ticketTypes) {
            final ticketData = {
              'name': ticketType['name'],
              'description': ticketType['description'],
              'price': ticketType['price'],
              'total_quantity': ticketType['quantity'],
            };

            await ref
                .read(apiServiceProvider)
                .addTicketType(createdEvent.id, ticketData);
          }
        }

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Event created successfully!')),
          );
          context.pop();
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to create event. Please try again.')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
