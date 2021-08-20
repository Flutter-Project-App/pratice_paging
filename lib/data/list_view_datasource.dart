import 'package:tuple/tuple.dart';
import 'package:fl_paging/fl_paging.dart' as paging;

import 'models/note_model.dart';
import 'note_repository.dart';

class ListViewDataSource extends paging.PageKeyedDataSource<int, Note> {
  NoteRepository noteRepository;
  ListViewDataSource(this.noteRepository);

  @override
  Future<Tuple2<List<Note>, int>> loadInitial(int pageSize) async {
    return Tuple2(await noteRepository.getNotes(0), 1);
  }

  @override
  Future<Tuple2<List<Note>, int>> loadPageAfter(
      int params, int pageSize) async {
    return Tuple2(await noteRepository.getNotes(params), params + 1);
  }
}