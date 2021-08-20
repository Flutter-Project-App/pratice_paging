import '../data/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  NoteWidget(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          color: Theme.of(context).cardColor),
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text('${note.id}'),
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ))
        ],
      ),
    );
  }
}
