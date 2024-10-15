part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {
 
  final int currentIndex;

  NavigationState({ required  this.currentIndex, });
}

final class HomeState extends NavigationState {
  HomeState( { required  super.currentIndex,});
}

final class ProfileState extends NavigationState {
  ProfileState({ required super.currentIndex});
}
