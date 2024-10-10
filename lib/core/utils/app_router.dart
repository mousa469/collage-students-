import 'package:go_router/go_router.dart';
import 'package:students_collage/features/authentication/presentation/views/register_view.dart';
import 'package:students_collage/features/authentication/presentation/views/sign_in_view.dart';

class AppRouter {
  static const kSignInview = '/';
  static const kRegisterview = '/RegisterView';

  static var  routes = GoRouter(routes: [
    GoRoute(
      path: kSignInview,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kRegisterview,
      builder: (context, state) => const RegisterView(),
    ),
  ]);
}
