import 'package:flutter/material.dart';
import 'package:job_helper/app/ui/positions_list.dart';

class MyAlertDialog extends StatefulWidget {
  MyAlertDialog({Key key}) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

// an alert dialog to filter the data by desired output
// filter by position only works for the gitHub API data

class _MyAlertDialogState extends State<MyAlertDialog>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SimpleDialog(
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            setState(() {
              showGithub = true;
              showUsaGov = false;
              showByPosition = false;
              //showByLocation = false;
            });
            Navigator.pop(context);
          },
          child: const Text('Show GitHub Positions'),
        ),
        SimpleDialogOption(
          onPressed: () {
            setState(() {
              showGithub = false;
              showUsaGov = true;
              showByPosition = false;
             // showByLocation = false;
            });
             Navigator.of(context).pop();
          },
          child: const Text('Show Usa Goverment Positions'),
        ),
        SimpleDialogOption(
          onPressed: () {
               setState(() {
              showGithub = false;
              showUsaGov = false;
              showByPosition = true;
            //  showByLocation = false;
            });
             Navigator.of(context).pop();
          },
          child: const Text('Filter By Position Title '),
        ),
          SimpleDialogOption(
          onPressed: () {
            setState(() {
              showGithub = false;
              showUsaGov = false;
              showByPosition = false;
            //  showByLocation = false;
            });
            Navigator.pop(context);
          },
          child: const Text('Remove Filters'),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
