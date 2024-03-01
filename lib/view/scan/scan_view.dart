import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/view/tool/tool_read_view.dart';
import 'package:campus/view_model/tool_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../config/app_settings.dart';
import '../../model/tool.dart';
import '../../view_model/scan_view_model.dart';

class ScanView extends StatefulWidget {
  const ScanView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    developer.log('ScanView - createState()');
    return ScanViewState();
  }
}

class ScanViewState extends State<StatefulWidget> {
  late ScanViewModel _svm;

  @override
  void initState() {
    developer.log('ToolViewState - initState()');
    _svm = Provider.of<ScanViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('ToolViewState - build()');

    var result = '';

    return Scaffold(
        appBar: AppSettings.appBarSettings(),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // Début
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        if (res is String) {
                          result = res;
                          developer.log('result : $result');
                          _svm.barCodeToolReader(result).then((value) {
                            if (value != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ToolReadView(tvm: ToolViewModel(), tool: value)));
                            } else {
                              developer.log('ScanView - : Le code barre lu ne correspond à aucun des équipements');
                            }
                          });
                        } else {
                          developer.log('ScanView - : Erreur de lecture de code barre');
                        }
                      });
                    }, // fin
                    //__________________________//
                    // onPressed: () {  // début
                    //   _svm.barCodeToolReader('2024379413').then((value) {
                    //     if (value != null) {
                    //       developer.log('ScanView - ouaisletool : $ouaisletool');
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   ToolReadView(tvm: ToolViewModel(), tool: value)));
                    //     } else {
                    //       developer.log('ScanView - ouaisletool : Error');
                    //     }
                    //   });
                    // }, // fin
                    child: const Text('Code Barre'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => {}, child: const Text('NFC')),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(onPressed: () => {}, child: const Text('QR Code')),
              ]),
            ]),
        drawer: NavDrawableWidget());
  }
}
