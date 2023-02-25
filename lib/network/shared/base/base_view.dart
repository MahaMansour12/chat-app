
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_navigator.dart';
import 'base_view_model.dart';

abstract class base_view<T extends StatefulWidget, VM extends base_view_model>
    extends State<T> implements base_navigator {
  late VM viewModel;
  VM initViewModel();
  @override
  void initState() {

    super.initState();
    viewModel = initViewModel();
  }


}
