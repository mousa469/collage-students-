import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/features/authentication/presentation/views/register_view.dart';
import 'package:students_collage/features/authentication/presentation/views/sign_in_view.dart';
import 'package:students_collage/features/home/presentation/manager/navigation_cubit/cubit/navigation_cubit.dart';
import 'package:students_collage/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const kSignInview = '/';
  static const kRegisterview = '/RegisterView';
  static const kHomeView = '/HomeView';

  static var routes = GoRouter(routes: [
    GoRoute(
      path: kSignInview,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: kRegisterview,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => NavigationCubit(),
        child:  HomeView(
          email: state.extra as String     ,
          ),
      ),
    ),
  ]);
}
