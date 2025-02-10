// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ScanValidationType { SSCC, SGTIN }

final barcodeControllerProvider =
    StateNotifierProvider.autoDispose<BarcodeController, List<String>>((ref) {
  return BarcodeController([]);
});

class BarcodeController extends StateNotifier<List<String>> {
  BarcodeController(super.state);
  void removeByIndex(int index) {
    final ne = state;
    try {
      ne.removeAt(index - 1);
    } catch (e) {
      debugPrint(e.toString());
    }
    state = ne;
  }

  void startContiniousBarcodeScan(ScanValidationType type) async {
    final List<String> barcodes = [];
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen(
      onDone: () => state,
      (barcode) async {
        switch (type) {
          case ScanValidationType.SGTIN:
            break;
          case ScanValidationType.SSCC:
            if (barcode.toString().contains('(00)')) {
              try {
                // await HapticFeedback.heavyImpact();
                await Vibrate.vibrate();
              } catch (e) {
                debugPrint(e.toString());
              }
            } else if (!barcode.toString().contains('-1')) {
              FlutterBeep.beep(false);
            }
            break;
          default:
            if (barcode.toString().contains('(') &&
                barcode.toString().contains(')')) {
              // await HapticFeedback.heavyImpact();
              await Vibrate.vibrate();
            } else if (!barcode.toString().contains('-1')) {
              FlutterBeep.beep(false);
            }
            break;
        }
        if (!barcode.toString().contains('-1') && !state.contains(barcode)) {
          barcodes.add(barcode);
          state.add(barcode);
        }
      },
    );
  }
}
