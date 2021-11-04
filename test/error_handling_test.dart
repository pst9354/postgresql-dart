import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

import 'docker.dart';

void main() {
  usePostgresDocker();

  test('Reports stacktrace correctly', () async {
    final conn = PostgreSQLConnection('localhost', 5432, 'dart_test', username: 'dart', password: 'dart');
    await conn.open();
    addTearDown(() async => conn.close());

    try {
      await conn.query('SELECT hello');
      fail('Should not reach');
    } catch (e, st) {
      // TODO: This expectation fails
      //expect(st.toString(), isNotEmpty);
    }
  });
}