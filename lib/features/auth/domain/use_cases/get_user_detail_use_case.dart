import 'package:fpdart/fpdart.dart';

import '../../../../common/entities/user_entity.dart';
import '../../../../common/errors/failure.dart';
import '../../../../common/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class GetUserDetailUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  GetUserDetailUseCase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return authRepository.getUserDetail();
  }
}
