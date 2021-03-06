import 'dart:developer' as developer;

import 'package:fl_paging/fl_paging.dart';
import 'package:flutter/material.dart';
import 'package:pratice_paging/data/list_view_datasource.dart';
import 'package:pratice_paging/data/models/note_model.dart';
import 'package:pratice_paging/data/note_repository.dart';
import 'package:pratice_paging/widgets/note_widget.dart';

class ListPageView extends StatefulWidget {
  static const ROUTE_NAME = 'ListPageView';

  @override
  _ListPageViewState createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  static const TAG = 'ListPageView';
  final GlobalKey key = GlobalKey();
  late ListViewDataSource dataSource;

  @override
  void initState() {
    dataSource = ListViewDataSource(NoteRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('build', name: TAG);
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo ListView'),
        centerTitle: true,
      ),
      body: PagingListView<Note>(
        key: key,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, data, child) {
          return NoteWidget(data);
        },
        pageDataSource: dataSource,
      ),
    );
  }
}
