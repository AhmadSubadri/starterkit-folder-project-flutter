import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/data/models/user_model.dart';

final userProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  final keepAlive = ref.keepAlive();

  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  } finally {
    Future.delayed(Duration(minutes: 5), () {
      keepAlive.close();
    });
  }
});
