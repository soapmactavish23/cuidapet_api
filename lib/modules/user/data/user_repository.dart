// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_api/application/database/i_database_connection.dart';
import 'package:cuidapet_api/application/exceptions/database_exception.dart';
import 'package:cuidapet_api/application/exceptions/user_exists_exception.dart';
import 'package:cuidapet_api/application/helpers/cript_helper.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/entities/user.dart';
import 'package:cuidapet_api/modules/user/data/i_user_repository.dart';
import 'package:mysql1/mysql1.dart';

class UserRepository implements IUserRepository {
  final IDatabaseConnection connection;
  final ILogger log;

  UserRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<User> createUser(User user) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final query = '''
        insert into usuario(email, tipo_usuario, img_avatar, senha, fornecedor_id, social_id)
        values(?, ?, ?, ?, ?, ?)
      ''';
      final result = await conn.query(query, [
        user.email,
        user.regiterType,
        user.imageAvatar,
        CriptHelper.generateSha256Hash(user.password ?? ''),
        user.supplierId,
        user.socialKey,
      ]);

      final userId = result.insertId;

      return user.copyWith(id: userId, password: null);
    } on MySqlException catch (e, s) {
      if (e.message.contains('usuario.email_UNIQUE')) {
        log.error('Usuário já cadastrado na base de dados', e, s);
        throw UserExistsException();
      }
      log.error('Erro ao criar usuário', e, s);
      throw DatabaseException(message: 'Erro ao criar usuário', exception: e);
    } finally {
      await conn?.close();
    }
  }
}
