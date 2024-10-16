import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:students_collage/core/utils/service_locator.dart';
import 'package:students_collage/features/authentication/data/repos/auth_repo/authentication_repo_impl.dart';
import 'package:students_collage/features/authentication/presentation/manager/auth_cubit/cubit/auth_cubit.dart';
import 'package:students_collage/features/authentication/presentation/manager/save_user_info_into_firestore/cubit/save_user_info_into_firestore_cubit.dart';
import 'package:students_collage/features/authentication/presentation/views/register_view.dart';
import 'package:students_collage/features/authentication/presentation/views/sign_in_view.dart';
import 'package:students_collage/features/authentication/presentation/views/user_details_view.dart';
import 'package:students_collage/features/home/presentation/manager/navigation_cubit/cubit/navigation_cubit.dart';
import 'package:students_collage/features/home/presentation/views/home_view.dart';

class AppRouter {
  static const kSignInview = '/';
  static const kRegisterview = '/RegisterView';
  static const kHomeView = '/HomeView';
  static const kUserDetailsView = '/UserDeatilsView';

  static var routes = GoRouter(routes: [
    GoRoute(
      path: kSignInview,
      builder: (context, state) => BlocProvider(
         create: (context) => AuthCubit(
            authenticationRepoImpl: getIt.get<AuthenticationRepoImpl>(),
          ),
        child: const SignInView()),
    ),
    GoRoute(
      path: kRegisterview,
      builder: (context, state) => BlocProvider(
         create: (context) => AuthCubit(
            authenticationRepoImpl: getIt.get<AuthenticationRepoImpl>(),
          ),
        child: const RegisterView()),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => NavigationCubit(),
        child: HomeView(
          email: state.extra as String,
        ),
      ),
    ),
    GoRoute(
      path: kUserDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SaveUserInfoIntoFirestoreCubit(),
        child:  UserDetailsView(
          email: state.extra as String ,

        ),
      ),
    ),
  ]);
}
