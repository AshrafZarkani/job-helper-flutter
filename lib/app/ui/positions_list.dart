import 'package:flutter/material.dart';
import 'package:job_helper/app/models/positions.dart';
import 'package:job_helper/app/ui/widgets/github/list_view_for_github.dart';
import 'package:job_helper/app/ui/widgets/usagov/list_view_for_usagov.dart';
import 'package:provider/provider.dart';

// boolean parameters for data filtering
bool showGithub = false;
bool showUsaGov = false;
bool showByPosition = false;
//bool showByLocation = false;

class PositionList extends StatelessWidget {
  PositionList({Key key}) : super(key: key);

  // a loading widget at loading state
  Widget _loading(BuildContext context) => Container(
        key: Key('Loading'),
        height: MediaQuery.of(context).size.height / 2,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<Positions>(
      builder: (context, model, child) =>
          model.isLoading ? _loading(context) : _content(context, model),
    );
  }

  // the body content of the HomePage
  // separated into two ListViews
  Widget _content(BuildContext context, Positions model) {
    if (showGithub) {
      return ListViewForGitHub(model: model);
    } else if (showUsaGov) {
      return ListViewForUsaGov(model: model);
    } else if (showByPosition) {
      return Column(
        children: [
          ListViewForGitHub(
            model: model,
            showByPosition: showByPosition,
          ),
          ListViewForUsaGov(
            model: model,
            showByPosition: showByPosition,
          ),
        ],
      );
    }
    return Column(
        children: [
          ListViewForGitHub(model: model),
          ListViewForUsaGov(model: model),
        ],
      );
  }
}
