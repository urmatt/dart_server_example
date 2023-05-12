import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import 'persistence/mysql_client.dart';

final mysqlClient = MysqlClient();

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  // 1. Execute any custom code prior to starting the server...

  // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  return serve(handler, ip, 8888);
}

Middleware databaseHandler() {
  return (handler) {
    return handler.use(
      provider<MysqlClient>(
        (context) => mysqlClient,
      ),
    );
  };
}
