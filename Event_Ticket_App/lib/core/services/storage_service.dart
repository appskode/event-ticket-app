import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ticket_model.dart';
import '../models/user_model.dart';

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});

class StorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _ticketsKey = 'my_tickets';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    if (userData != null) {
      return User.fromJson(jsonDecode(userData));
    }
    return null;
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<void> saveTickets(List<Ticket> tickets) async {
    final prefs = await SharedPreferences.getInstance();
    final ticketsJson = tickets.map((t) => t.toJson()).toList();
    await prefs.setString(_ticketsKey, jsonEncode(ticketsJson));
  }

  Future<List<Ticket>> getStoredTickets() async {
    final prefs = await SharedPreferences.getInstance();
    final ticketsData = prefs.getString(_ticketsKey);
    if (ticketsData != null) {
      final List<dynamic> ticketsJson = jsonDecode(ticketsData);
      return ticketsJson.map((t) => Ticket.fromJson(t)).toList();
    }
    return [];
  }

  Future<void> removeTickets() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_ticketsKey);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
