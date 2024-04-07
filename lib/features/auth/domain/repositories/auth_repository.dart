import 'package:fpdart/fpdart.dart';

import '../../../../common/entities/user_entity.dart';
import '../../../../common/errors/failure.dart';
import '../../data/models/user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserModel>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> userSignUp({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, UserEntity>> getUserDetail();
  Future<Either<Failure, String>> logout();
}
