import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/view/tool/tool_read_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../../model/operation.dart';
import '../../view_model/operation_view_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    developer.log('DashboardView - createState()');
    return DashboardViewState();
  }
}

class DashboardViewState extends State<DashboardView> {

  late OperationViewModel _ovm;

  @override
  void initState() {
    developer.log('DashboardViewState - initState()');
    _ovm = Provider.of<OperationViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('DashboardViewState - build()');
    _ovm.initBrowOperations();
    ();

    return Scaffold(

    );

  }
}