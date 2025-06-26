import 'package:event_ticket_app/screens/events/widget/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers/auth_provider.dart';
import '../../core/providers/events_provider.dart';
import '../../widget/custom_app_bar.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(eventsProvider.notifier).loadEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final eventsState = ref.watch(eventsProvider);
    final user = authState.user;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Events',
        actions: [
          if (user?.isAdmin == true)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.push('/admin/create-event'),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(eventsProvider.notifier).loadEvents(refresh: true),
        child: eventsState.events.isEmpty && eventsState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : eventsState.events.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.event_busy, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'No events available',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: eventsState.events.length +
                        (eventsState.hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= eventsState.events.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      return EventCard(
                        event: eventsState.events[index],
                        onTap: () => context
                            .push('/event/${eventsState.events[index].id}'),
                      );
                    },
                  ),
      ),
    );
  }
}
