import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';
import '../entities/authenticated_user.dart';

abstract class AuthenticationRepository {
  Future<Either<ServerFailure, AuthenticatedUserEntity>> getUser(String username, String password);
}