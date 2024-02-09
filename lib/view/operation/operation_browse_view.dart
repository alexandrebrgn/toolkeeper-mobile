import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/view/tool/tool_read_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../../config/app_settings.dart';

import '../../model/operation.dart';
import '../../view_model/operation_view_model.dart';
import 'operation_read_view.dart';

class OperationBrowseView extends StatefulWidget {
  const OperationBrowseView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    developer.log('OperationBrowseView - createState()');
    return OperationBrowseViewState();
  }
}

class OperationBrowseViewState extends State<OperationBrowseView> {

  late OperationViewModel _ovm;

  @override
  void initState() {
    developer.log('OperationBrowseViewState - initState()');
    _ovm = Provider.of<OperationViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('OperationBrowseViewState - build()');
    _ovm.initBrowOperations();
    ();

    return Scaffold(
        appBar: AppSettings.appBarSettings(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20, 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child : const Text('Opérations de maintenance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
            ),
            Expanded(
                child: RefreshIndicator(
                    onRefresh: () => _ovm.initBrowOperations(),
                    child: FutureBuilder<List<Operation>>(
                        future : _ovm.operations,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {

                            List<Operation> operations = snapshot.data!;

                            return ListView.builder(
                                itemCount: operations.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      leading: Icon(Icons.fire_extinguisher),
                                      trailing: Icon(Icons.arrow_right),
                                      onTap: () {
                                        developer.log('ToolViewState - build() - Appui sur l\'opération : $index');
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => OperationReadView(ovm:_ovm,operation:operations[index])));
                                      },
                                      subtitle: Text(operations[index].report),
                                      title: Text(AppSettings.frenchFormat(operations[index].toDoDate, '')),
                                  );
                                }
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }
                    )
                )
            )
          ],
        ),
        drawer: const NavDrawableWidget()
    );

  }
}