import 'package:ljbikes/src/ljbikes_base.dart';

void main() {
  retrieveAllStands()
      .then((stands) => print(stands?.map((stand) => stand.location)))
      .catchError((error) => print(error));
}
