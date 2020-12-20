import 'dart:io';

import 'package:ljbikes/src/ljbikes_base.dart';
import 'package:test/test.dart';

void main() {
  final base = LJBikesBase.instance;

  setUpAll(() => HttpOverrides.global = null);

  test('retrieve bike stands in Ljubljana', () async {
    final stands = await base.retrieveAllStands();
    print('Found ${stands?.length} stands');
    expect(stands != null, true);
  });
}
