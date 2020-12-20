import 'dart:io';

import 'package:ljbikes/src/ljbikes_base.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  test('retrieve bike stands in Ljubljana', () async {
    final stands = await retrieveAllStands();
    print(stands);
    expect(stands != null, true);
  });
}
