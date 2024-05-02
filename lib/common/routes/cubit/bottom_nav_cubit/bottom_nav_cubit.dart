import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_cubit_state.dart';

class BottomNavCubit extends Cubit<BottomNavCubitState> {
  BottomNavCubit() : super(const BottomNavCubitInitial());

  // @override
  // void onChange(Change<BottomNavCubitState> change) {
  //   super.onChange(change);
  //   print('BottomNavCubitState Change - $change');
  // }

  void updateRoute(Map<String, dynamic> routeData) {
    emit(
      BottomNavCubitInitial(
        index: routeData['index'],
        routeName: routeData['routeName'],
      ),
    );
  }
}
