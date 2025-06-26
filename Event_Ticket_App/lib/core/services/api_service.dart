import 'package:dio/dio.dart';
import 'package:event_ticket_app/core/constants/api_constants.dart';
import 'package:event_ticket_app/core/services/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_constants.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      ApiConstants.contentType: 'application/json',
      ApiConstants.accept: 'application/json',
    },
    // Add these for debugging
    validateStatus: (status) {
      return status! < 500; // Accept responses with status code less than 500
    },
  ));

  // Add logging interceptor for debugging
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    responseHeader: false,
    error: true,
    logPrint: (obj) {
      debugPrint('🌐 API LOG: $obj');
    },
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      debugPrint('🚀 Making request to: ${options.baseUrl}${options.path}');

      final token = await ref.read(storageServiceProvider).getToken();
      if (token != null) {
        options.headers[ApiConstants.authorization] = 'Bearer $token';
      }
      handler.next(options);
    },
    onResponse: (response, handler) {
      AppConstants.print('✅ Response received: ${response.statusCode}');

      handler.next(response);
    },
    onError: (error, handler) async {
      AppConstants.print('❌ API Error: ${error.message}');
      AppConstants.print('❌ Error Type: ${error.type}');
      AppConstants.print('❌ Status Code: ${error.response?.statusCode}');

      if (error.response?.statusCode == 401) {
        // Token expired, try to refresh
        try {
          final refreshed = await ref.read(apiServiceProvider).refreshToken();
          if (refreshed) {
            // Retry the request
            final token = await ref.read(storageServiceProvider).getToken();
            error.requestOptions.headers[ApiConstants.authorization] =
                'Bearer $token';
            final response = await dio.fetch(error.requestOptions);
            handler.resolve(response);
            return;
          }
        } catch (e) {
          AppConstants.print('❌ Token refresh failed: $e');
        }
      }
      handler.next(error);
    },
  ));

  return dio;
});

final Provider<ApiService> apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(storageServiceProvider);
  return ApiService(dio, storage);
});

class ApiService {
  final Dio _dio;
  final StorageService _storage;

  ApiService(this._dio, this._storage);

  // Test connection method
  Future<bool> testConnection() async {
    try {
      AppConstants.print('🔍 Testing connection to: ${ApiConstants.baseUrl}');
      final response = await _dio.get('/test',
          options: Options(
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ));
      AppConstants.print(
          '✅ Connection test successful: ${response.statusCode}');
      return true;
    } catch (e) {
      AppConstants.print('❌ Connection test failed: $e');
      return false;
    }
  }

  // Auth endpoints with better error handling
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      AppConstants.print('🔐 Attempting login for: $email');
      final response = await _dio.post(ApiConstants.login, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
            'Login failed with status code: ${response.data["message"] ?? "Unknown error"}');
      }
      AppConstants.print('✅ Login successful');
      return response.data;
    } on DioException catch (e) {
      AppConstants.print('❌ Login failed: ${e.message}');
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    try {
      AppConstants.print('📝 Attempting registration for: $email');
      final response = await _dio.post(ApiConstants.register, data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
      });
      AppConstants.print('✅ Registration successful');
      return response.data;
    } on DioException catch (e) {
      AppConstants.print('❌ Registration failed: ${e.message}');
      _handleDioError(e);
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiConstants.logout);
      AppConstants.print('✅ Logout successful');
    } on DioException catch (e) {
      AppConstants.print('⚠️ Logout failed (but continuing): ${e.message}');
      // Don't rethrow logout errors
    }
  }

  Future<Map<String, dynamic>> getMe() async {
    try {
      final response = await _dio.get(ApiConstants.me);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final response = await _dio.post(ApiConstants.refresh);
      final token = response.data['token'];
      if (token != null) {
        await _storage.saveToken(token);
        return true;
      }
      return false;
    } catch (e) {
      AppConstants.print('❌ Token refresh failed: $e');
      return false;
    }
  }

  // Event endpoints
  Future<Map<String, dynamic>> getEvents(
      {int page = 1, int perPage = 10}) async {
    try {
      final response = await _dio.get(ApiConstants.events, queryParameters: {
        'page': page,
        'per_page': perPage,
      });
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getEvent(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.events}/$id');

      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createEvent(
      Map<String, dynamic> eventData) async {
    try {
      final response = await _dio.post(ApiConstants.events, data: eventData);

      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Map<String, dynamic>> addTicketType(
      int eventId, Map<String, dynamic> ticketData) async {
    try {
      final response = await _dio.post(
          '${ApiConstants.events}/$eventId/ticket-types',
          data: ticketData);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Purchase endpoints
  Future<Map<String, dynamic>> purchaseTickets(
      int eventId, List<Map<String, dynamic>> tickets) async {
    try {
      final response = await _dio.post(ApiConstants.purchase, data: {
        'event_id': eventId,
        'tickets': tickets,
      });
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception(
            'Failed to purchase tickets: ${response.data["message"] ?? "Failed"}');
      }

      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPurchases({int page = 1}) async {
    try {
      final response = await _dio.get(ApiConstants.purchases, queryParameters: {
        'page': page,
      });
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPurchase(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.purchases}/$id');
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Ticket endpoints
  Future<Map<String, dynamic>> getMyTickets(
      {int page = 1, String? status}) async {
    try {
      final response = await _dio.get(ApiConstants.myTickets, queryParameters: {
        'page': page,
        if (status != null) 'status': status,
      });
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getTicket(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.tickets}/$id');
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> cancelTicket(int id) async {
    try {
      final response = await _dio.post('${ApiConstants.tickets}/$id/cancel');
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  // Error handling helper
  void _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw Exception(
            'Connection timeout. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        throw Exception('Request timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        throw Exception('Server response timeout. Please try again.');
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Unknown server error';
        throw Exception('Server error ($statusCode): $message');
      case DioExceptionType.cancel:
        throw Exception('Request was cancelled.');
      case DioExceptionType.connectionError:
        throw Exception(
            'Cannot connect to server. Please check if your Laravel server is running at ${ApiConstants.baseUrl}');
      case DioExceptionType.unknown:
        throw Exception('Network error: ${e.message}');
      default:
        throw Exception('Unexpected error: ${e.message}');
    }
  }
}
