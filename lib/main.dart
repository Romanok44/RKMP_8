import 'package:flutter/material.dart';
import 'app.dart';
import 'shared/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const PollApp());
}