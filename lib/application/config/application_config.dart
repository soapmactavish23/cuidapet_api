import 'package:cuidapet_api/application/config/database_connection_configuration.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    _loadEnv();
    _loadDatabaseConfig();
  }

  _loadEnv() => DotEnv(includePlatformEnvironment: true)..load();

  void _loadDatabaseConfig() {
    var env = _loadEnv();
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['DATABASE_HOST'] ?? env['databaseHost'],
      user: env['DATABASE_USER'] ?? env['databaseUser'],
      port: int.tryParse(env['DATABASE_PORT'] ?? '') ??
          int.tryParse(env['databasePort']) ??
          0,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword'],
      databaseName: env['DATABASE_NAME'] ?? env['databaseName'],
    );
    GetIt.I.registerSingleton(databaseConfig);
  }
}
