import 'package:fluttertoast/fluttertoast.dart';

Future<void> displayToast(String message) async {
  await Fluttertoast.showToast(
    msg: message,
    fontSize: 16.0,
  );
}
