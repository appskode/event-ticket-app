import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_dialogs.dart';
import '../../../core/models/user_model.dart';
import '../../../core/providers/auth_provider.dart';
import '../../../widget/custom_app_bar.dart';
import 'info_row.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user, required this.ref});
  final User user;
  final WidgetRef ref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Text(
                      user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.7),
                      fontSize: 16,
                    ),
                  ),
                  if (user.isAdmin) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Account Information
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    InfoRow(
                        context: context,
                        icon: Icons.person,
                        label: 'Name',
                        value: user.name),
                    const Divider(),
                    InfoRow(
                        context: context,
                        icon: Icons.email,
                        label: 'Email',
                        value: user.email),
                    const Divider(),
                    InfoRow(
                        context: context,
                        icon: user.isAdmin
                            ? Icons.admin_panel_settings
                            : Icons.person,
                        label: 'Account Type',
                        value: user.isAdmin ? 'Administrator' : 'Regular User'),
                    const Divider(),
                    InfoRow(
                        context: context,
                        icon: Icons.calendar_today,
                        label: 'Member Since',
                        value: _formatDate(user.createdAt)),
                    if (user.emailVerifiedAt != null) ...[
                      const Divider(),
                      InfoRow(
                          context: context,
                          icon: Icons.verified,
                          label: 'Email Verified',
                          value: _formatDate(user.emailVerifiedAt!)),
                    ] else ...[
                      const Divider(),
                      InfoRow(
                          context: context,
                          icon: Icons.warning,
                          label: 'Email Status',
                          value: 'Not Verified'),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showLogoutDialog(context, ref),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    final date = DateTime.parse(dateString);
    return DateFormat('MMM dd, yyyy').format(date);
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    CustomDialogs.showConfirmationDialog(
      context: context,
      title: 'Logout',
      message: 'Are you sure you want to logout?',
      cancelText: 'Cancel',
      confirmText: 'Logout',
      confirmButtonColor: Colors.red,
      onConfirm: () async {
        Navigator.of(context).pop();
        ref.read(authProvider.notifier).logout();
      },
    );
  }
}
