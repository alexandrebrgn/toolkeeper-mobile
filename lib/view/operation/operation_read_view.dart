import 'dart:developer' as developer;
import 'package:campus/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../config/app_settings.dart';

//View_model
import '../../view_model/operation_view_model.dart';

// Model
import '../../model/operation.dart';

class OperationReadView extends StatefulWidget {

  final OperationViewModel? ovm;
  final Operation? operation;
  const OperationReadView({super.key, this.ovm, this.operation});

  @override
  State<StatefulWidget> createState() {
    developer.log('OperationReadView - createState()');
    return OperationReadViewState();
  }
}

class OperationReadViewState extends State<OperationReadView> {

  @override
  void initState() {
    developer.log('OperationReadViewState - initState()');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('OperationReadViewState - build()');
    widget.ovm!.initReadOperation(widget.operation!.id);
    return Scaffold(
      appBar: AppSettings.appBarSettings(),
      body: SingleChildScrollView(
        child : RefreshIndicator(
          onRefresh: () => widget.ovm!.initReadOperation(widget.operation!.id),
          child: FutureBuilder<Operation?> (
            future: widget.ovm!.selectedOperation,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Operation operation = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children : [
                        Container (
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                          child : const Text('Détails de l\'opération de maintenance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Card (
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(),
                          margin: EdgeInsets.all(20.0),
                          elevation: 1.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Date d\'opération : ${AppSettings.frenchFormat(operation.date, '')}'),
                                subtitle: Text('Opérateur : ${operation.user!.firstName} ${operation.user!.lastName}'),
                              ),
                              Container(
                                width: double.infinity,
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                                  child: Text('Rapport de l\'opération')
                                )
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
                                    child: Container (
                                      color: Colors.white,
                                      alignment: Alignment.topLeft,
                                      height: 100,
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                          child : Text('${operation.report}')
                                      ),
                                  )
                                )
                              )
                            ],
                          ),
                        )
                      ]
                    ),
                    Column(
                      children : [
                        Container (
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(16.0, 16.0, 0, 0),
                          child : const Text('Equipement lié', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Card (
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(),
                          margin: EdgeInsets.all(20.0),
                          elevation: 1.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('Equipement : ${operation.tool!.number}'),
                                subtitle: Text('N° Série : ${operation.tool!.serialId}'),
                              )
                            ],
                          ),
                        )
                      ]
                    )
                  ]
                );
              } else if (snapshot.hasError){
                return Text('${snapshot.error}');
              } else {
                return const Center(child : CircularProgressIndicator());
              }
            }
          )
        )
      ),
    );
  }

}