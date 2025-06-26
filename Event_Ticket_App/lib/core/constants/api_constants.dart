class ApiConstants {
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';
  static const String refresh = '/auth/refresh';
  static const String events = '/events';
  static const String purchase = '/purchase';
  static const String purchases = '/purchases';
  static const String myTickets = '/my-tickets';
  static const String tickets = '/tickets';

  // Headers
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
}
