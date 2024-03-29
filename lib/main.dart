import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zapit_demo/app.dart';

/// App start-up (main function)
Future<void> main() async {
  await loadInit();
  runApp(const ZapitApp());
}

/// initialize properties
loadInit() async {
  await GetStorage.init();
}
