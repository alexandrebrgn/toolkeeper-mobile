import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'dart:developer' as developer;

import '../../model/operation.dart';

import '../../view_model/operation_view_model.dart';

class OperationEditView extends StatefulWidget {
  final Operation? operation;
  final OperationViewModel? ovm;

  const OperationEditView({super.key, this.ovm, this.operation});

  @override
  State<StatefulWidget> createState() {
    return OperationEditViewState();
  }
}

class OperationEditViewState extends State<OperationEditView>{
  final TextEditingController reportController = TextEditingController();
  DateTime? dateNextOperation;

  @override
  Widget build(BuildContext context) {
    reportController.text = widget.operation!.report;
    reportController.selection = TextSelection.fromPosition(TextPosition(offset: reportController.text.length));


    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Center(
              child: Text('Update Operation', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, height: 2, fontWeight: FontWeight.bold),
              ),
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Date',
              ),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 1000)),
              initialPickerDateTime: DateTime.now().add(const Duration(days: 31)),
              onChanged: (DateTime? value) {
                dateNextOperation = value;
              },
            ),
            TextField(autofocus: false, controller: reportController, decoration: const InputDecoration(icon: Icon(Icons.account_tree), hintText: 'Report')
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Store'),
              onPressed: () {
                developer.log('OperationEditViewState - onPressed()');
                widget.ovm!.editOperation({
                  'id': widget.operation!.id.toString(),
                  'report' : reportController.text,
                  'dateNextOperation' : dateNextOperation.toString(),
                }).then((value) {
                  developer.log('Value : $value');
                 if(value) {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     backgroundColor: Colors.green,
                     content: Text('Successfully updated a operation !')
                   ));
                   Navigator.of(context).pop();
                 } else {
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     backgroundColor: Colors.red,
                     content: Text('Error ! You may not be allowed !'),
                   ));
                 }
                }).whenComplete( () {
                  Navigator.of(context).pop();
                });
              }
            )
          ],
        )
      )
    );
  }

}