import 'package:flutter/material.dart';
import 'package:podkes_app/core/config/app_config.dart';
import 'my_app.dart';

void main() {
  AppConfig.initialize(Environment.dev);
  runApp(const MyApp());
}
