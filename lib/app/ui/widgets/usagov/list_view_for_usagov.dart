import 'package:flutter/material.dart';
import 'package:job_helper/app/models/positions.dart';
import 'package:job_helper/app/ui/widgets/usagov/list_tile_for_usagov.dart';

class ListViewForUsaGov extends StatelessWidget {
  final Positions model;
  final bool showByPosition;
  const ListViewForUsaGov({
    this.showByPosition,
    this.model,
    Key key,
  }) : super(key: key);

  // a list view builder with a separator to show the list tile of
  // usa gov apis
  // could not filter by position for the usa gov data as i could not
  // find a way to assign the data retrieved in the UsaGov class

  @override
  Widget build(BuildContext context) {
    return showByPosition == false
        ? ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final usaPosition = model.usaPositions['SearchResult']
                  ['SearchResultItems'][index]['MatchedObjectDescriptor'];
              return ListTileForUsaGov(usaPosition);
            },
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemCount:
                model.usaPositions['SearchResult']['SearchResultItems'].length,
          )
        : ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final usaPosition = model.usaPositions['SearchResult']
                  ['SearchResultItems'][index]['MatchedObjectDescriptor'];
            
              return ListTileForUsaGov(usaPosition);
            },
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemCount:
                model.usaPositions['SearchResult']['SearchResultItems'].length,
          );
  }
}
