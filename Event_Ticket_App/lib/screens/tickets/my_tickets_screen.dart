import 'package:event_ticket_app/screens/tickets/widget/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/providers/tickets_provider.dart';
import '../../widget/custom_app_bar.dart';

class MyTicketsScreen extends ConsumerStatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  ConsumerState<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends ConsumerState<MyTicketsScreen> {
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
      ref.read(ticketsProvider.notifier).loadTickets();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ticketsState = ref.watch(ticketsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "My Tickets"),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(ticketsProvider.notifier).loadTickets(refresh: true),
        child: ticketsState.tickets.isEmpty && ticketsState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ticketsState.tickets.isEmpty
                ? Stack(
                    children: [
                      ListView(
                        children: [],
                      ),
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.confirmation_number_outlined,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No tickets yet',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Purchase tickets for events to see them here',
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : _buildTicketsList(ticketsState),
      ),
    );
  }

  Widget _buildTicketsList(TicketsState ticketsState) {
    final upcomingTickets = ticketsState.tickets
        .where(
          (ticket) =>
              ticket.event != null &&
              DateTime.parse(ticket.event!.eventDate).isAfter(DateTime.now()),
        )
        .toList();
    final pastTickets = ticketsState.tickets
        .where(
          (ticket) =>
              ticket.event != null &&
              DateTime.parse(ticket.event!.eventDate).isBefore(DateTime.now()),
        )
        .toList();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Upcoming',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF121417)),
            ),
            SizedBox(
              height: 12,
            ),
            (upcomingTickets.isEmpty)
                ? Text("No Past Tickets")
                : Column(
                    children: upcomingTickets
                        .map(
                          (ticket) => TicketCard(
                            ticket: ticket,
                            onTap: () => context.push('/ticket/${ticket.id}'),
                          ),
                        )
                        .toList(),
                  ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Past',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            (pastTickets.isEmpty)
                ? Text("No Past Tickets")
                : Column(
                    children: pastTickets
                        .map(
                          (ticket) => TicketCard(
                            ticket: ticket,
                            onTap: () => context.push('/ticket/${ticket.id}'),
                          ),
                        )
                        .toList(),
                  ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
