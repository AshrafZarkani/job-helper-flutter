import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_helper/app/models/github_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:date_format/date_format.dart';

class ListTileForGitHub extends StatelessWidget {
  final GitHubApi position;
  const ListTileForGitHub(this.position, {Key key}) : super(key: key);

  // convert date fromat from retrieved format
  // to the required display format
  String convertDateFromString(String strDate) {
    DateTime todayDate =
        DateFormat("EEE MMM dd hh:mm:ss UTC yyyy").parse(strDate, true);
    return formatDate(todayDate, [dd, '/', mm, '/', yyyy]);
  }

  // list tile to show the output of github api parsing to the user
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        child: ListTile(
          leading: position.companyLogo != null
              ? Image.network(
                  position.companyLogo,
                  width: 100,
                  height: 100,
                )
              : Image.asset("assets/upload.png", width: 100, height: 100),
          title: Text(position.title),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Text(position.company ?? ""),
                  Text(position.location),
                  Text(
                    convertDateFromString(position.createdAt),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () async {
          if (await canLaunch(position.url)) {
            await launch(position.url);
          } else {
            throw 'Could not launch ${position.url}';
          }
        },
      ),
    );
  }
}
