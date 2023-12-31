// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/models/current_track_model.dart';

class TracksList extends StatelessWidget {
  final List<Song> track;
  const TracksList({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      headingTextStyle:
          Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      columns: [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: track.map((e) {
        final selected =
            context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = TextStyle(
          color: selected
              ? Theme.of(context).hintColor
              : Theme.of(context).iconTheme.color,
        );
        return DataRow(
          cells: [
            DataCell(Text(
              e.title,
              style: textStyle,
            )),
            DataCell(Text(
              e.artist,
              style: textStyle,
            )),
            DataCell(Text(
              e.album,
              style: textStyle,
            )),
            DataCell(Text(
              e.duration,
              style: textStyle,
            )),
          ],
          selected: selected,
          onSelectChanged: (_) =>
              context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}
