import 'package:event_ticket_app/core/providers/auth_provider.dart';
import 'package:event_ticket_app/screens/admin/create_event_screen.dart';
import 'package:event_ticket_app/screens/auth/login_screen.dart';
import 'package:event_ticket_app/screens/auth/register_screen.dart';
import 'package:event_ticket_app/screens/events/event_detail_screen.dart';
import 'package:event_ticket_app/screens/main_screen.dart';
import 'package:event_ticket_app/screens/purchase/purchase_screen.dart';
import 'package:event_ticket_app/screens/splash/splash_screen.dart';
import 'package:event_ticket_app/screens/tickets/ticket_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;

      final isAuthRoute = state.matchedLocation.startsWith('/auth');

      if (!isAuthenticated &&
          !isAuthRoute &&
          state.matchedLocation.startsWith('/register')) {
        return '/auth/register';
      }
      if (!isAuthenticated && !isAuthRoute) {
        return '/auth/login';
      }

      if (isAuthenticated && state.matchedLocation == "/") {
        return '/mainScreen';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: '/mainScreen', builder: (context, state) => const MainScreen()),
      GoRoute(
        path: '/auth/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/event/:id',
        builder: (context, state) =>
            EventDetailScreen(eventId: int.parse(state.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/purchase/:eventId',
        builder: (context, state) => PurchaseScreen(
          eventId: int.parse(state.pathParameters['eventId']!),
        ),
      ),
      GoRoute(
        path: '/ticket/:id',
        builder: (context, state) => TicketDetailScreen(
          ticketId: int.parse(state.pathParameters['id']!),
        ),
      ),
      GoRoute(
        path: '/admin/create-event',
        builder: (context, state) => const CreateEventScreen(),
      ),
    ],
  );
});
