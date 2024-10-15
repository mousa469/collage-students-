import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_collage/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:students_collage/features/profile/presentation/views/widgets/profile_view_body.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(HomeState(currentIndex: 0));
  

 
  navigateTo({required int index}) {
    if (index == 0) {
      emit(
        HomeState(currentIndex: index),
      );
    } else if (index == 1) {
      emit(
        ProfileState(currentIndex: index),
      );
    }
  }
}
