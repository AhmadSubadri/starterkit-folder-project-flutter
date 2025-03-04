// routes.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/core/providers/auth_provider.dart' as auth;
import 'package:myapp/presentation/screens/auth/login_screen.dart';
import 'package:myapp/presentation/screens/home_screen.dart';
import 'package:myapp/presentation/screens/component/onboarding.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(auth.authProvider);
  final hasSeenOnboarding = ref.watch(auth.onboardingProvider);

  return GoRouter(
    initialLocation:
        (!hasSeenOnboarding && !isLoggedIn)
            ? '/onboarding'
            : (isLoggedIn ? '/' : '/login'),
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/onboarding',
        builder:
            (context, state) => OnboardingPage(
              pages: [
                OnboardingPageModel(
                  title: "Selamat Datang!",
                  description: "Aplikasi terbaik untuk kebutuhanmu.",
                  image: "assets/images/intro1.png",
                ),
                OnboardingPageModel(
                  title: "Kemudahan Akses",
                  description: "Nikmati pengalaman terbaik dalam genggaman.",
                  image: "assets/images/intro2.png",
                ),
                OnboardingPageModel(
                  title: "Mulai Sekarang",
                  description: "Login dan rasakan manfaatnya!",
                  image: "assets/images/intro3.png",
                ),
              ],
            ),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    ],
    redirect: (context, state) {
      // Kondisi redirect sudah cukup baik, tidak perlu diubah
      if (!isLoggedIn &&
          !hasSeenOnboarding &&
          state.matchedLocation != '/onboarding') {
        return '/onboarding';
      }
      if (!isLoggedIn &&
          hasSeenOnboarding &&
          state.matchedLocation == '/onboarding') {
        return '/login';
      }
      if (isLoggedIn && state.matchedLocation == '/login') {
        return '/';
      }
      return null;
    },
  );
});
