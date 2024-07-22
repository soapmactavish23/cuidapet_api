import 'dart:io';

import 'package:cuidapet_api/modules/teste/teste_controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:cuidapet_api/application/config/application_config.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  //Application Config
  final appConfig = ApplicationConfig();
  final router = Router();
  appConfig.loadConfigApplication(router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(router.call, ip, port);
  print('Server listening on port ${server.port}');
}
