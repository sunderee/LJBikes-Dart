import 'package:ljbikes/src/ljbikes_base.dart';

Future<void> main() async {
  final stands = await LJBikesBase.instance.retrieveAllStands();
  print('Found total of ${stands?.length} stands.');
  print('Printing stands with more than 5 available bikes...');
  stands
      ?.where((stand) => (stand.availableBikes ?? -1) >= 5)
      .map((stand) => 'Address ${stand.address}, ${stand.availableBikes} bikes')
      .forEach((standString) => print(standString));
}
