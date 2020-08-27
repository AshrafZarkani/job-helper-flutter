import 'package:flutter/material.dart';
import 'package:job_helper/app/models/github_api.dart';
import 'package:job_helper/app/models/positions.dart';
import 'package:job_helper/app/ui/widgets/github/list_tile_for_position.dart';

class ListViewForGitHub extends StatelessWidget {
  final Positions model;
  final bool showByPosition;
  const ListViewForGitHub({
    this.model,
    Key key,
    this.showByPosition,
  }) : super(key: key);

  // listView builder with a separator to show the list Tiles of data retrieved
  // from github api
  // a boolean check for the Filters applied by the user
  @override
  Widget build(BuildContext context) {
    return showByPosition == false
        ? ListView.separated(
            key: Key('Content'),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final position = model.positions[index];
              return ListTileForGitHub(position);
            },
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemCount: model.positions.length,
          )
        : ListView.separated(
            key: Key('Content'),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final position = model.positions;
              List<GitHubApi> x = position
                ..sort(
                    (a, b) => a.title.toString().compareTo(b.title.toString()));
              return ListTileForGitHub(x[index]);
            },
            separatorBuilder: (context, index) => const Divider(height: 1.0),
            itemCount: model.positions.length,
          );
  }
}
