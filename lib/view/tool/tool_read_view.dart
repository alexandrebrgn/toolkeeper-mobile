import 'dart:developer' as developer;
import 'package:campus/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../config/app_settings.dart';

//View_model
import '../../view_model/tool_view_model.dart';
import '../../view_model/operation_view_model.dart';

// Model
import '../../model/tool.dart';
import '../operation/operation_read_view.dart';

class ToolReadView extends StatefulWidget {

  final ToolViewModel? tvm;
  final Tool? tool;
  const ToolReadView({super.key, this.tvm, this.tool});

  @override
  State<StatefulWidget> createState() {
    developer.log('ToolReadView - createState()');
    return ToolReadViewState();
  }
}

class ToolReadViewState extends State<ToolReadView> {

  @override
  void initState() {
    developer.log('ToolReadViewState - initState()');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('ToolReadViewState - build()');
    widget.tvm!.initReadTool(widget.tool!.id);
    return Scaffold(
      appBar: AppSettings.appBarSettings(),
      body: SingleChildScrollView(
        child:RefreshIndicator(
          onRefresh: () => widget.tvm!.initReadTool(widget.tool!.id),
          child:FutureBuilder<Tool?>(
            future: widget.tvm!.selectedTool,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Tool tool = snapshot.data!;
                return Column (
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container (
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                      child : const Text('Détails de l\'équipement', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(),
                      margin: EdgeInsets.all(20.0),
                      elevation: 1.0,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('Equipement : ${tool.name}'),
                            leading: AppSettings.iconOfCategory(tool.category!.name),
                            subtitle: Text('N° Série : ${tool.serialId}'),
                          ),
                          Container(
                            height: 200.0,
                            child: Ink.image(
                              image: const NetworkImage('https://picsum.photos/300/200'),
                            )
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children : [
                                const Icon(Icons.location_on),
                                Text('Localisation : ${tool.localisation}', style: TextStyle(fontSize: 10),),
                              ])
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                              alignment: Alignment.centerLeft,
                              child:
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  Text('Prochaine maintenance prévue le : ${AppSettings.frenchFormat(tool.dateNextOperation,'')}', style: TextStyle(fontSize: 10),)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Container (
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                      child: const Text('Historique des opérations', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(),
                      margin: EdgeInsets.all(20.0),
                      elevation: 1.0,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: tool.operations?.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(Icons.build),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    developer.log('ToolViewState - build() - Appui sur l\'équipement : $index');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => OperationReadView(ovm: OperationViewModel(),operation:tool.operations![index])));
                                  },
                                  title: Text(tool.operations![index].report),
                                   subtitle: Text('Effectuée le : ${AppSettings.frenchFormat(tool.operations![index].date, '')}'),
                                );
                              }
                          )
                        ],
                      ),
                    ),
                  ]
                );
              }
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
                return const Center(child : CircularProgressIndicator());
            }
          )
        )
      )
    );
  }

}