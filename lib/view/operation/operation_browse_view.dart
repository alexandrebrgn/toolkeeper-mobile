import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/view/tool/tool_read_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../../model/operation.dart';
import '../../view_model/operation_view_model.dart';

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
        appBar: AppBar(
            title: const Text('ToolKeeper')
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Opérations de maintenance'),
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
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder: (context) => ToolReadView(tvm:_ovm,tool:tools[index])));
                                      },
                                      subtitle: Text(operations[index].report),
                                      title: Text(operations[index].toDoDate)
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