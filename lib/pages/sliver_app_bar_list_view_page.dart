import 'package:fl_paging/fl_paging.dart' as paging;
import 'package:flutter/material.dart';
import 'package:pratice_paging/data/list_view_datasource.dart';
import 'package:pratice_paging/data/models/note_model.dart';
import 'package:pratice_paging/data/note_repository.dart';
import 'package:pratice_paging/widgets/note_widget.dart';

class SliverAppBarListViewPage extends StatefulWidget {
  static const ROUTE_NAME = 'SliverAppBarListViewPage';

  @override
  _SliverAppBarListViewPageState createState() =>
      _SliverAppBarListViewPageState();
}

class _SliverAppBarListViewPageState extends State<SliverAppBarListViewPage> {
  static const TAG = 'SliverAppBarListViewPage';
  late ListViewDataSource dataSource;

  @override
  void initState() {
    dataSource = ListViewDataSource(NoteRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverAppBar(
              expandedHeight: 250,
              collapsedHeight: kToolbarHeight + 1,
              title: Text('Sliver Appbar'),
              snap: false,
              floating: false,
              leading: Container(
                child: CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              ),
            )
          ];
        },
        body: paging.PagingListView<Note>(
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, data, child) {
            return NoteWidget(data);
          },
          pageDataSource: dataSource,
        ),
      ),
    );
  }
}
