import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<void> showToast(BuildContext context, String msg) async{
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
  );
}