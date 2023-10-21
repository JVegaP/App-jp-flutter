import 'package:flutter/material.dart';
import 'package:jp_app_flutter/core/di/dependency_injection_config.dart';
import 'package:jp_app_flutter/jp_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const JpApp());
}