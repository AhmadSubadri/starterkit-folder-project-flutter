import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StreamProvider<String>((ref) {
  return Stream.periodic(Duration(seconds: 1), (_) {
    return DateTime.now().toLocal().toString();
  });
});
