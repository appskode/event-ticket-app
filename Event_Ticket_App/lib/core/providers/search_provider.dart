import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:event_ticket_app/core/services/api_service.dart';

import '../models/event_model.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return SearchNotifier(apiService);
});

class SearchState {
  final List<Event> suggestions; // Changed from List<String> to List<Event>
  final List<Event> searchResults;
  final bool isLoadingSuggestions;
  final bool isLoadingResults;
  final String? error;
  final String query;
  final Map<String, dynamic> filters;

  SearchState({
    this.suggestions = const [],
    this.searchResults = const [],
    this.isLoadingSuggestions = false,
    this.isLoadingResults = false,
    this.error,
    this.query = '',
    this.filters = const {},
  });

  SearchState copyWith({
    List<Event>? suggestions, // Updated type
    List<Event>? searchResults,
    bool? isLoadingSuggestions,
    bool? isLoadingResults,
    String? error,
    String? query,
    Map<String, dynamic>? filters,
  }) {
    return SearchState(
      suggestions: suggestions ?? this.suggestions,
      searchResults: searchResults ?? this.searchResults,
      isLoadingSuggestions: isLoadingSuggestions ?? this.isLoadingSuggestions,
      isLoadingResults: isLoadingResults ?? this.isLoadingResults,
      error: error,
      query: query ?? this.query,
      filters: filters ?? this.filters,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  final ApiService _apiService;

  SearchNotifier(this._apiService) : super(SearchState());

  Future<void> fetchSuggestions(String query, {int limit = 5}) async {
    if (query.isEmpty) {
      state = state.copyWith(suggestions: [], isLoadingSuggestions: false);
      return;
    }

    state = state.copyWith(isLoadingSuggestions: true, query: query);

    try {
      final response = await _apiService.get(
        '/events/search',
        queryParameters: {'q': query},
      );

      final suggestions = (response['data']["data"] as List).map((json) {
        return Event.fromJson(json);
      }).toList();
      state = state.copyWith(
        suggestions: suggestions,
        isLoadingSuggestions: false,
        error: null,
      );
    } catch (e) {
      rethrow;
      state = state.copyWith(
        suggestions: [],
        isLoadingSuggestions: false,
        error: e.toString(),
      );
    }
  }

  Future<void> searchEvents({
    required String query,
    String? location,
    String? dateFrom,
    String? dateTo,
  }) async {
    state = state.copyWith(isLoadingResults: true, query: query);

    try {
      final filters = {
        'q': query,
        if (location != null && location.isNotEmpty) 'location': location,
        if (dateFrom != null && dateFrom.isNotEmpty) 'date_from': dateFrom,
        if (dateTo != null && dateTo.isNotEmpty) 'date_to': dateTo,
      };

      final response = await _apiService.get(
        '/events/search',
        queryParameters: filters,
      );
      final events = (response['data'] as List)
          .map((json) => Event.fromJson(json))
          .toList();

      state = state.copyWith(
        searchResults: events,
        isLoadingResults: false,
        filters: filters,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        searchResults: [],
        isLoadingResults: false,
        error: e.toString(),
      );
    }
  }

  void clearSearch() {
    state = SearchState();
  }
}
