import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spotify_clone/data/data.dart';
import 'package:spotify_clone/models/current_track.dart';

class TracksList extends StatelessWidget {
  const TracksList({Key? key, required this.tracks}) : super(key: key);
  final List<Song> tracks;
  @override
  Widget build(BuildContext context) {
    return DataTable(
    headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0) ,
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(label: Icon(Icons.access_time))
        ],
        rows: tracks.map((e) {
          final selected = context.watch<CurrentTrackModel>().selected?.id==e.id;
          final textStyle = TextStyle(
            color: selected ? Theme.of(context).accentColor : Theme.of(context).iconTheme.color
          );
          return DataRow(
            cells: [
              DataCell(
                Text(e.title,
                    style: textStyle
                ),
              ),
              DataCell(
                Text(e.artist, style: textStyle
                ),
              ),
              DataCell(
                Text(e.album, style: textStyle
                ),
              ),
              DataCell(
                Text(e.duration, style: textStyle
                ),
              ),
            ],
            selected: selected,
            onSelectChanged: (_)=>
                context.read<CurrentTrackModel>().selectTrack(e)
            );
        }).toList(),
    );
  }
}
