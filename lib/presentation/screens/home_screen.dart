import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/utils/snackbar_provider.dart';
import '../../core/providers/counter_provider.dart';
import '../../core/providers/user_riverpod.dart';

// https://dribbble.com/shots/7786063-Flato-Real-estate-mobile-app-statistics-and-filters
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final userAsyncValue = ref.watch(userProvider);
    final snackbarMessage = ref.watch(snackbarProvider);
    if (snackbarMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(snackbarMessage)));
        ref.read(snackbarProvider.notifier).state = null;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Welcome back!',
          style: TextStyle(
            color: Color.fromRGBO(0, 44, 119, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/hello.png'),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ahmad Subadri S.Kom',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 44, 119, 1),
                      ),
                      softWrap: true,
                    ),
                    Text(
                      'Programmer',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

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
