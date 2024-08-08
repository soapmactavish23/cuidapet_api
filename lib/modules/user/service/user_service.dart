// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_api/entities/user.dart';
import 'package:cuidapet_api/modules/user/data/i_user_repository.dart';
import 'package:cuidapet_api/modules/user/service/i_user_service.dart';
import 'package:cuidapet_api/modules/user/view_models/user_save_input_model.dart';

class UserService implements IUserService {
  IUserRepository userRepository;
  UserService({
    required this.userRepository,
  });

  @override
  Future<User> createUser(UserSaveInputModel user) async {
    final userEntity = User(
      email: user.email,
      password: user.password,
      regiterType: 'App',
      supplierId: user.supplierId,
    );

    return userRepository.createUser(userEntity);
  }
}
