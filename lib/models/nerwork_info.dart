import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {}

class _NetworkInfoImpl {
  final incrementConnectionChecker =
      InternetConnectionChecker().onStatusChange.listen((event) {
    (event) {};
  });
}
