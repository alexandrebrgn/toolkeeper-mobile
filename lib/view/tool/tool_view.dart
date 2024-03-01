import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/view/tool/tool_read_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../../config/app_settings.dart';
import '../../model/tool.dart';
import '../../view_model/tool_view_model.dart';

class ToolView extends StatefulWidget {
  const ToolView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    developer.log('StockView - createState()');
    return ToolViewState();
  }
}

class ToolViewState extends State<StatefulWidget> {

  late ToolViewModel _tvm;

  @override
  void initState() {
    developer.log('ToolViewState - initState()');
    _tvm = Provider.of<ToolViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('ToolViewState - build()');
    _tvm.initBrowTools();

    return Scaffold(
      appBar: AppSettings.appBarSettings(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20, 20),
                child: Container(
                  alignment: Alignment.topLeft,
                  child : const Text('Equipements', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _tvm.browTools(),
                child: FutureBuilder<List<Tool>>(
                  future : _tvm.tools,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {

                      List<Tool> tools = snapshot.data!;

                      return ListView.builder(
                          itemCount: tools.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: AppSettings.iconOfCategory(tools[index].category!.name),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () {
                                  developer.log('ToolViewState - build() - Appui sur l\'équipement : $index');
                                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ToolReadView(tvm:_tvm, tool:tools[index])));
                                },
                                subtitle: Text(tools[index].serialId),
                                title: Text(tools[index].name,)
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