import 'dart:developer';

import 'package:event_ticket_app/core/models/ticket_model.dart';
import 'package:event_ticket_app/core/services/api_service.dart';
import 'package:event_ticket_app/core/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ticketsProvider = StateNotifierProvider<TicketsNotifier, TicketsState>((
  ref,
) {
  final apiService = ref.watch(apiServiceProvider);
  final storage = ref.watch(storageServiceProvider);
  return TicketsNotifier(apiService, storage);
});

class TicketsState {
  final List<Ticket> tickets;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int currentPage;

  TicketsState({
    this.tickets = const [],
    this.isLoading = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 1,
  });

  TicketsState copyWith({
    List<Ticket>? tickets,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? currentPage,
  }) {
    return TicketsState(
      tickets: tickets ?? this.tickets,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class TicketsNotifier extends StateNotifier<TicketsState> {
  final ApiService _apiService;
  final StorageService _storage;

  TicketsNotifier(this._apiService, this._storage) : super(TicketsState()) {
    loadTickets();
  }

  Future<void> loadTickets({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(tickets: [], currentPage: 1, hasMore: true);
    }

    // Load from local storage first
    final storedTickets = await _storage.getStoredTickets();
    if (storedTickets.isNotEmpty && !refresh) {
      state = state.copyWith(tickets: storedTickets);
    }

    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _apiService.getMyTickets(page: state.currentPage);
      final List<dynamic> ticketsData = response['data']['data'];
      List<Ticket> newTickets = [];
      try {
        newTickets = ticketsData.map((t) {
          log(t.toString());
          return Ticket.fromJson(t);
        }).toList();
      } catch (e) {
        debugPrint(e.toString());
      }
      final hasMore = response['data']['next_page_url'] != null;

      final allTickets =
          refresh ? newTickets : [...state.tickets, ...newTickets];

      // Save to local storage
      await _storage.saveTickets(allTickets);

      state = state.copyWith(
        tickets: allTickets,
        isLoading: false,
        hasMore: hasMore,
        currentPage: state.currentPage + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> cancelTicket(int ticketId) async {
    try {
      await _apiService.cancelTicket(ticketId);
      await loadTickets(refresh: true);
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}
