import 'dart:developer' as developer;
import 'package:campus/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

//View_model
import '../../view_model/tool_view_model.dart';

// Model
import '../../model/tool.dart';

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
      appBar: AppBar(
        title: ListTile(
          title: Text(widget.tool!.number, style: const TextStyle(color: Colors.white),),
          subtitle: Text('${widget.tool!.serialId} produit(s)',
              style: const TextStyle(color: Colors.white, fontSize: 10)),
        ),
      ),
      body: FutureBuilder<Tool?>(
        future: widget.tvm!.selectedTool,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Tool tool = snapshot.data!;
            return Column (
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children :[
                    const Icon(Icons.fire_extinguisher),
                    Text('N ° ${tool.number}'),
                    Text('N° Série : ${tool.serialId}')
                  ]
                ),
                const Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.black
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Localisation : ${tool.localisation}')
                  ]
                ),
                const Divider(
                    height: 40,
                    thickness: 1,
                    color: Colors.black
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/tool', ModalRoute.withName('/tool')),
                  child: Text('Effectuer une opération'),
                )
              ]
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
            return const Center(child : CircularProgressIndicator());
        }
      )
    );
  }

}