import '../lib/main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:uni/model/erasmus/erasmus_db.dart';


// use this in the terminal to run the tests: 
// flutter drive --target=test_driver/app.dart
void main() {
  ErasmusDB.fetchData();

  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  runApp(MyApp());
}