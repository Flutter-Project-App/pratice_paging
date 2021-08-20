import 'dart:developer' as developer;

import 'package:fl_paging/fl_paging.dart';
import 'package:flutter/material.dart';
import 'package:pratice_paging/data/models/note_model.dart';
import 'package:pratice_paging/data/note_repository.dart';
import 'package:pratice_paging/pages/grid_view_page.dart';
import 'package:pratice_paging/pages/list_view_page.dart';
import 'package:pratice_paging/pages/sliver_app_bar_list_view_page.dart';
import 'package:pratice_paging/widgets/note_grid_widget.dart';
import 'package:pratice_paging/widgets/note_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Paging Test',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade200,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: GridViewPage(),
    );
  }
}


