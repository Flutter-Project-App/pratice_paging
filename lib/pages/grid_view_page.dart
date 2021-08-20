import 'package:flutter/material.dart';
import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:pratice_paging/data/list_view_datasource.dart';
import 'package:pratice_paging/data/models/note_model.dart';
import 'package:pratice_paging/data/note_repository.dart';
import 'package:pratice_paging/widgets/note_grid_widget.dart';

class GridViewPage extends StatefulWidget {
  static const ROUTE_NAME = 'GridViewPage';

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  static const TAG = 'GridViewPage';
  final GlobalKey key = GlobalKey();
  late ListViewDataSource dataSource;

  @override
  void initState() {
    dataSource = ListViewDataSource(NoteRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Demo GridView'),
      ),
      body: paging.PagingGridView<Note>(
        emptyBuilder: (context) {
          return Container();
        },
        key: key,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, data, child) {
          return NoteGridWidget(data);
        },
        delegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        pageDataSource: dataSource,
      ),
    );
  }
}
