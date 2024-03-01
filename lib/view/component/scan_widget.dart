import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ScanWidget extends StatelessWidget{
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.nfc),
      onPressed: () => {
        developer.log('NFC Icon pressed'),
        Navigator.pushNamedAndRemoveUntil(context, '/scan', ModalRoute.withName('/scan')),
      },
    );
  }
}