// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fpdart/fpdart.dart';

import '../../../../common/entities/user_entity.dart';
import '../../../../common/errors/failure.dart';
import '../../../../common/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUseCase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await authRepository.userSignUp(
      name: params.name,
      email: params.email,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}
