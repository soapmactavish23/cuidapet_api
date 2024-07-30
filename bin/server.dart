import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:cuidapet_api/application/config/application_config.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  //Application Config
  final appConfig = ApplicationConfig();
  final router = Router();
  appConfig.loadConfigApplication(router);

  var handler = const Pipeline()
      .addMiddleware((innerHandler) {
        print('Iniciando 1 middle');
        return (Request request) async {
          print('');
          return innerHandler(request);
        };
      })
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(router.call, ip, port);
  print('Server listening on port ${server.port}');
}
