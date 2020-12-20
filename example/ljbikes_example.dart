import 'package:ljbikes/src/ljbikes_base.dart';

void main() {
  retrieveAllStands()
      .then((stands) => print(stands?.map((stand) => stand.name)))
      .catchError((error) => print(error));
}
