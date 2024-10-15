import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/core/utils/app_router.dart';
import 'package:students_collage/core/utils/service_locator.dart';
import 'package:students_collage/features/authentication/data/repos/auth_repo/authentication_repo_impl.dart';
import 'package:students_collage/features/authentication/presentation/manager/auth_cubit/cubit/auth_cubit.dart';
import 'package:students_collage/features/home/presentation/manager/navigation_cubit/cubit/navigation_cubit.dart';
import 'package:students_collage/features/profile/presentation/manager/profile%20data%20cubit/cubit/profile_data_cubit.dart';

import 'package:students_collage/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setUpServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authenticationRepoImpl: getIt.get<AuthenticationRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileDataCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.routes,
        theme: ThemeData(scaffoldBackgroundColor: kScaffoldColor),
      ),
    );
  }
}
