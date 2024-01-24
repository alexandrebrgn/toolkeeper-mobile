import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToolKeeper')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Equipements'),
            Expanded(
              child: FutureBuilder<List<Tool>>(
                future : _tvm.tools,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {

                    List<Tool> tools = snapshot.data!;

                    return ListView.builder(
                        itemCount: tools.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              leading: Icon(Icons.fire_extinguisher),
                              trailing: Icon(Icons.arrow_right),
                              title: Text(tools[index].number
                              )
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
          ],
      ),
      drawer: const NavDrawableWidget()
    );
  }
}