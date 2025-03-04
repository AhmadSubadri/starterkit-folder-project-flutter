import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/counter_provider.dart';
import '../../core/providers/user_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Example')),
      body: Column(
        children: [
          // Counter Section
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter: $counter', style: TextStyle(fontSize: 24)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed:
                          () => ref.read(counterProvider.notifier).decrement(),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed:
                          () => ref.read(counterProvider.notifier).increment(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Users from API:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: userAsyncValue.when(
              data:
                  (users) => ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(user.id.toString())),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                  ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
