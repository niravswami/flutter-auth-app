import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/role_model.dart';
import '../../../domain/use_cases/get_admin_dashboard_all_roles_use_case.dart';

part 'admin_dashboard_roles_event.dart';
part 'admin_dashboard_roles_state.dart';

class AdminDashboardRolesBloc
    extends Bloc<AdminDashboardRolesEvent, AdminDashboardRolesState> {
  final GetAdminDashboardAllRolesUseCase _getAdminDashboardAllRolesUseCase;
  AdminDashboardRolesBloc(
      {required GetAdminDashboardAllRolesUseCase
          getAdminDashboardAllRolesUseCase})
      : _getAdminDashboardAllRolesUseCase = getAdminDashboardAllRolesUseCase,
        super(AdminDashboardRolesInitial()) {
    on<AdminDashboardGetRoles>(_onGetRoles);
  }

  _onGetRoles(event, emit) async {
    emit(AdminDashboardRolesLoading());
    final res = await _getAdminDashboardAllRolesUseCase(NoParams());
    res.fold(
      (l) =>
          emit(AdminDashboardRolesErrors(message: l.message, errors: l.errors)),
      (roles) => emit(AdminDashboardRolesSuccess(roles: roles)),
    );
  }
}
