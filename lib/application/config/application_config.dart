import 'package:dotenv/dotenv.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    final variavel = env['url_banco_de_dados'];
    print(variavel);
  }

  // void _loadEnv() => DotEnv(includePlatformEnvironment: true)..load();
}
