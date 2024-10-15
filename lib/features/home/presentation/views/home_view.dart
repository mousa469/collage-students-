import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_collage/constants.dart';
import 'package:students_collage/features/home/presentation/manager/navigation_cubit/cubit/navigation_cubit.dart';
import 'package:students_collage/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:students_collage/features/profile/presentation/views/widgets/profile_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.email});

  final String email;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget? viewWidget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is HomeState) {
          viewWidget = const HomeViewBody();
        } else {
          viewWidget = ProfileViewBody(
            email: widget.email,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: kPrimaryColor,
              currentIndex: state.currentIndex,
              onTap: (value) {
                BlocProvider.of<NavigationCubit>(context)
                    .navigateTo(index: value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.boy_outlined), label: "Profile"),
              ]),
          body: viewWidget,
        );
      },
    );
  }
}
