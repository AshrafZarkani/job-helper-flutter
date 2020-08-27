import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileForUsaGov extends StatelessWidget {
  final dynamic usaPosition;
  const ListTileForUsaGov(this.usaPosition, {Key key}) : super(key: key);

  // convert date data retrieved from usagov api to the desired format
    String convertDateFromStringUsaList(String strDate) {
    DateTime todayDate = DateFormat("yyyy-MM-dd").parse(strDate, true);
    return formatDate(todayDate, [dd, '/', mm, '/', yyyy]);
  }

  // list tile to show the output data retrieved
  @override
  Widget build(BuildContext context) {
    return Material(
          child: GestureDetector(
        child: ListTile(
          leading: Image.asset("assets/upload.png", width: 100, height: 100),
          title: Text(usaPosition['PositionTitle']),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Text(usaPosition['OrganizationName'] ?? ""),
                  Text(usaPosition['PositionLocationDisplay']),
                  Text(
                    convertDateFromStringUsaList(
                        usaPosition['PositionStartDate'].toString()),
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
        onTap: () async {
          if (await canLaunch(usaPosition['PositionURI'])) {
            await launch(usaPosition['PositionURI']);
          } else {
            throw 'Could not launch ${usaPosition['PositionURI']}';
          }
        },
      ),
    );
  }
}
