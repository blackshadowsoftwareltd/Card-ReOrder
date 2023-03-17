import 'package:card_reorder/home.dart' show HomeScreen;
import 'package:flutter/material.dart' show MaterialApp, runApp;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;

void main() =>
    runApp(const ProviderScope(child: MaterialApp(home: HomeScreen())));
