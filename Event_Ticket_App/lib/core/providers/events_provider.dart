import 'package:event_ticket_app/core/models/event_model.dart';
import 'package:event_ticket_app/core/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventsProvider = StateNotifierProvider<EventsNotifier, EventsState>((
  ref,
) {
  final apiService = ref.watch(apiServiceProvider);
  return EventsNotifier(apiService);
});

class EventsState {
  final List<Event> events;
  final bool isLoading;
  final String? error;
  final bool hasMore;
  final int currentPage;

  EventsState({
    this.events = const [],
    this.isLoading = false,
    this.error,
    this.hasMore = true,
    this.currentPage = 1,
  });

  EventsState copyWith({
    List<Event>? events,
    bool? isLoading,
    String? error,
    bool? hasMore,
    int? currentPage,
  }) {
    return EventsState(
      events: events ?? this.events,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class EventsNotifier extends StateNotifier<EventsState> {
  final ApiService _apiService;

  EventsNotifier(this._apiService) : super(EventsState()) {
    loadEvents();
  }

  Future<void> loadEvents({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(events: [], currentPage: 1, hasMore: true);
    }

    if (state.isLoading || !state.hasMore) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _apiService.getEvents(page: state.currentPage);
      final List<dynamic> eventsData = response['data']['data'];

      List<Event> newEvents = [];
      try {
        newEvents = eventsData.map((e) => Event.fromJson(e)).toList();
      } catch (e) {
        rethrow;
      }

      final hasMore = response['data']['next_page_url'] != null;

      state = state.copyWith(
        events: refresh ? newEvents : [...state.events, ...newEvents],
        isLoading: false,
        hasMore: hasMore,
        currentPage: state.currentPage + 1,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> createEvent(Map<String, dynamic> eventData) async {
    try {
      await _apiService.createEvent(eventData);
      await loadEvents(refresh: true);
      return true;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return false;
    }
  }
}
