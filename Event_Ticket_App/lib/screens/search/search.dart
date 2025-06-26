import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:event_ticket_app/screens/events/widget/event_card.dart';
import 'package:event_ticket_app/core/providers/search_provider.dart';
import 'package:event_ticket_app/widget/custom_app_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    ref.read(searchProvider.notifier).fetchSuggestions(query);
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      ref.read(searchProvider.notifier).searchEvents(query: query);
      _searchFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Search Events',
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocus,
              decoration: InputDecoration(
                hintText: 'Search events...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(searchProvider.notifier).clearSearch();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onSubmitted: _performSearch,
            ),
          ),
          // Suggestions or Results
          Expanded(
            child: searchState.isLoadingSuggestions
                ? const Center(child: CircularProgressIndicator())
                : searchState.suggestions.isNotEmpty &&
                        _searchController.text.isNotEmpty
                    ? ListView.builder(
                        itemCount: searchState.suggestions.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          final suggestion = searchState.suggestions[index];
                          return ListTile(
                            leading:
                                const Icon(Icons.event, color: Colors.grey),
                            title: Text(suggestion.name), // Display event title
                            onTap: () {
                              context.push('/event/${suggestion.id}');
                            },
                          );
                        },
                      )
                    : searchState.isLoadingResults
                        ? const Center(child: CircularProgressIndicator())
                        : searchState.error != null
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error,
                                        size: 64, color: Colors.red),
                                    const SizedBox(height: 16),
                                    Text(
                                      searchState.error!,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            : searchState.searchResults.isEmpty
                                ? const Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.event_busy,
                                            size: 64, color: Colors.grey),
                                        SizedBox(height: 16),
                                        Text(
                                          'No events found',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: searchState.searchResults.length,
                                    itemBuilder: (context, index) {
                                      final event =
                                          searchState.searchResults[index];
                                      return EventCard(
                                        event: event,
                                        onTap: () =>
                                            context.push('/event/${event.id}'),
                                      );
                                    },
                                  ),
          ),
        ],
      ),
    );
  }
}
