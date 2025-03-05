import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/providers/auth_provider.dart';
import 'package:myapp/core/theme/theme2_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed:
                  () => ref.read(themeNotifierProvider.notifier).toggleTheme(),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed:
                () => ref.read(themeNotifierProvider.notifier).toggleTheme(),
          ),
          IconButton(
            onPressed: () => ref.read(authProvider.notifier).logout(),
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Profile Screen'),
          ElevatedButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleTheme();
            },
            child: Text('Toggle Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(authProvider.notifier).logout();
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
