import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/role_model.dart';
import '../../../domain/use_cases/role_use_cases/assign_permissions_to_role_use_case.dart';
import '../../../domain/use_cases/role_use_cases/create_admin_dashboard_role_use_case.dart';
import '../../../domain/use_cases/role_use_cases/delete_admin_dashboard_role_use_case.dart';
import '../../../domain/use_cases/role_use_cases/get_admin_dashboard_all_roles_use_case.dart';
import '../../../domain/use_cases/role_use_cases/update_admin_dashboard_role_use_case.dart';

part 'admin_dashboard_roles_event.dart';
part 'admin_dashboard_roles_state.dart';

class AdminDashboardRolesBloc
    extends Bloc<AdminDashboardRolesEvent, AdminDashboardRolesState> {
  final GetAdminDashboardAllRolesUseCase _getAdminDashboardAllRolesUseCase;
  final CreateAdminDashboardRoleUseCase _createAdminDashboardRoleUseCase;
  final UpdateAdminDashboardRoleUseCase _updateAdminDashboardRoleUseCase;
  final DeleteAdminDashboardRoleUseCase _deleteAdminDashboardRoleUseCase;
  final AssignPermissionsToRoleUseCase _assignPermissionsToRoleUseCase;
  AdminDashboardRolesBloc({
    required GetAdminDashboardAllRolesUseCase getAdminDashboardAllRolesUseCase,
    required CreateAdminDashboardRoleUseCase createAdminDashboardRoleUseCase,
    required UpdateAdminDashboardRoleUseCase updateAdminDashboardRoleUseCase,
    required DeleteAdminDashboardRoleUseCase deleteAdminDashboardRoleUseCase,
    required AssignPermissionsToRoleUseCase assignPermissionsToRoleUseCase,
  })  : _getAdminDashboardAllRolesUseCase = getAdminDashboardAllRolesUseCase,
        _createAdminDashboardRoleUseCase = createAdminDashboardRoleUseCase,
        _updateAdminDashboardRoleUseCase = updateAdminDashboardRoleUseCase,
        _deleteAdminDashboardRoleUseCase = deleteAdminDashboardRoleUseCase,
        _assignPermissionsToRoleUseCase = assignPermissionsToRoleUseCase,
        super(AdminDashboardRolesInitial()) {
    on<AdminDashboardGetRoles>(_onGetRoles);
    on<AdminDashboardCreateRole>(_onCreateRole);
    on<AdminDashboardUpdateRole>(_onUpdateRole);
    on<AdminDashboardDeleteRole>(_onDeleteRole);
    on<AssignPermissionsToRole>(_onAssignPermissionsToRole);
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

  _onCreateRole(event, emit) async {
    emit(AdminDashboardRoleCreateLoading());
    final res = await _createAdminDashboardRoleUseCase(
        CreateAdminDashboardRoleParams(role: event.role));
    res.fold(
      (l) =>
          emit(AdminDashboardRolesErrors(message: l.message, errors: l.errors)),
      (role) {
        emit(AdminDashboardRoleCreateSuccess(role: role));
      },
    );
  }

  _onUpdateRole(event, emit) async {
    emit(AdminDashboardRoleCreateLoading());
    final res =
        await _updateAdminDashboardRoleUseCase(UpdateAdminDashboardRoleParams(
      roleData: event.roleData,
      newRoleName: event.newRoleName,
    ));
    res.fold(
      (l) =>
          emit(AdminDashboardRolesErrors(message: l.message, errors: l.errors)),
      (role) {
        emit(AdminDashboardRoleUpdateSuccess(role: role));
      },
    );
  }

  _onDeleteRole(event, emit) async {
    emit(AdminDashboardRoleDeleteLoading());
    final res =
        await _deleteAdminDashboardRoleUseCase(DeleteAdminDashboardRoleParams(
      roleData: event.roleData,
    ));
    res.fold(
      (l) =>
          emit(AdminDashboardRolesErrors(message: l.message, errors: l.errors)),
      (role) {
        emit(AdminDashboardRoleDeleteSuccess(role: role));
      },
    );
  }

  _onAssignPermissionsToRole(
    AssignPermissionsToRole event,
    Emitter<AdminDashboardRolesState> emit,
  ) async {
    emit(AssignPermissionsToRoleLoading());
    final res = await _assignPermissionsToRoleUseCase(
        AssignPermissionsToRoleUseCaseParams(
      roleData: event.roleData,
      permissionIds: event.permissionIds,
    ));
    res.fold(
      (l) =>
          emit(AdminDashboardRolesErrors(message: l.message, errors: l.errors)),
      (role) {
        emit(AssignPermissionsToRoleSuccess(role: role));
      },
    );
  }
}
