part of 'bottom_nav_cubit.dart';

sealed class BottomNavCubitState extends Equatable {
  const BottomNavCubitState();

  @override
  List<Object> get props => [];
}

final class BottomNavCubitInitial extends BottomNavCubitState {
  final int index;
  final String routeName;
  const BottomNavCubitInitial({
    this.index = 0,
    this.routeName = 'home',
  });

  @override
  List<Object> get props => [index, routeName];
}
