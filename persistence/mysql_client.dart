import 'package:mysql_client/mysql_client.dart';

class MysqlClient {
  factory MysqlClient() {
    return _inst;
  }

  MysqlClient._internal() {
    _connect();
  }

  Future<IResultSet> execute(
      String query, {
        Map<String, dynamic>? params,
        bool iterable = false,
      }) async {
    if (_connection == null || _connection?.connected == false) {
      await _connect();
    }
    if (_connection?.connected == false) {
      throw Exception('Could not connect to the database');
    }
    return _connection!.execute(query, params, iterable);
  }

  static final MysqlClient _inst = MysqlClient._internal();
}

MySQLConnection? _connection;

/// initialises a connection to database
Future<void> _connect() async {
  _connection = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "root",
    password: "123456",
    databaseName: "your_database_name",
  );
  await _connection?.connect();
}
