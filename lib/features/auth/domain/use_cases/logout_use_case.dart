import 'package:fpdart/fpdart.dart';

import '../../../../common/errors/failure.dart';
import '../../../../common/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<String, NoParams> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  @override
  Future<Either<Failure, String>> call(params) async {
    return await authRepository.logout();
  }
}
