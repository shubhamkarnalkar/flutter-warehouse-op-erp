import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:warehouse_erp/utils/initialization.dart';
import 'app.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  Future.wait(
    [
      !kIsWeb
          ? SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp])
          : Future.delayed(Duration.zero),
    ],
  ).then(
    (value) {
      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
  );
}
