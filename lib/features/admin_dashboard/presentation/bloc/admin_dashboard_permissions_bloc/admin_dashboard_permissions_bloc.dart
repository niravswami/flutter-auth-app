import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/use_case/use_case.dart';
import '../../../data/models/permission_model.dart';
import '../../../domain/use_cases/permission_use_cases/create_permission_use_case.dart';
import '../../../domain/use_cases/permission_use_cases/delete_permission_use_case.dart';
import '../../../domain/use_cases/permission_use_cases/get_permissions_use_case.dart';
import '../../../domain/use_cases/permission_use_cases/update_permission_use_case.dart';

part 'admin_dashboard_permissions_event.dart';
part 'admin_dashboard_permissions_state.dart';

class AdminDashboardPermissionsBloc extends Bloc<AdminDashboardPermissionsEvent,
    AdminDashboardPermissionsState> {
  final GetAdminDashboardPermissionsUseCase getAdminDashboardPermissionsUseCase;
  final CreatePermissionUseCase createPermissionUseCase;
  final UpdatePermissionUseCase updatePermissionUseCase;
  final DeletePermissionUseCase deletePermissionUseCase;
  AdminDashboardPermissionsBloc({
    required this.getAdminDashboardPermissionsUseCase,
    required this.createPermissionUseCase,
    required this.updatePermissionUseCase,
    required this.deletePermissionUseCase,
    // }) : super(AdminDashboardPermissionsInitial()) {
  }) : super(AdminDashboardPermissionsState.initial()) {
    on<AdminDashboardPermissionsEvent>((event, emit) {});
    on<GetAdminDashboardPermissions>(_onGetPermissions);
    on<CreateAdminDashboardPermission>(_onCreatePermission);
    on<UpdateAdminDashboardPermission>(_onUpdatePermission);
    on<DeleteAdminDashboardPermission>(_onDeletePermission);
  }

  _onGetPermissions(AdminDashboardPermissionsEvent event,
      Emitter<AdminDashboardPermissionsState> emit) async {
    emit(AdminDashboardPermissionsState.loading(true));

    final res = await getAdminDashboardPermissionsUseCase(NoParams());
    res.fold(
      (l) => emit(AdminDashboardPermissionsState.error(
          message: l.message, errors: l.errors)),
      (permissions) => emit(
        AdminDashboardPermissionsState.success(permissions),
      ),
    );
  }

  _onCreatePermission(CreateAdminDashboardPermission event,
      Emitter<AdminDashboardPermissionsState> emit) async {
    emit(AdminDashboardPermissionsState.loading(true));
    final res = await createPermissionUseCase(
      CreatePermissionUseCaseParams(permission: event.permission),
    );

    res.fold(
      (l) => emit(AdminDashboardPermissionsState.error(
          message: l.message, errors: l.errors)),
      (permission) {
        emit(
          AdminDashboardPermissionsState.permissionCreated(permission),
        );
      },
    );
  }

  _onUpdatePermission(UpdateAdminDashboardPermission event,
      Emitter<AdminDashboardPermissionsState> emit) async {
    emit(AdminDashboardPermissionsState.loading(true));

    final res = await updatePermissionUseCase(
      UpdatePermissionUseCaseParams(
        permissionData: event.permissionData,
        text: event.text,
      ),
    );
    res.fold(
      (l) => emit(AdminDashboardPermissionsState.error(
          message: l.message, errors: l.errors)),
      (permission) => emit(
        AdminDashboardPermissionsState.permissionUpdated(permission),
      ),
    );
  }

  _onDeletePermission(DeleteAdminDashboardPermission event,
      Emitter<AdminDashboardPermissionsState> emit) async {
    emit(AdminDashboardPermissionsState.loading(true));

    final res = await deletePermissionUseCase(
      DeletePermissionUseCaseParams(
        permissionData: event.permissionData,
      ),
    );
    res.fold(
      (l) => emit(AdminDashboardPermissionsState.error(
          message: l.message, errors: l.errors)),
      (permission) => emit(
        AdminDashboardPermissionsState.permissionDeleted(permission),
      ),
    );
  }
}
