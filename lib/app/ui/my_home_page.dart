import 'package:flutter/material.dart';
import 'package:job_helper/app/ui/positions_list.dart';
import 'package:job_helper/app/ui/widgets/alert_dialog.dart';
import 'package:job_helper/app/ui/widgets/search_field.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // two scaffold keys for search field and home page scaffold
  var homeScaffoldKey = GlobalKey<ScaffoldState>();
  get getHomePageScaffold => homeScaffoldKey;
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  final controller = TextEditingController();
  String city = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: homeScaffoldKey,
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'JobHelper',
                textAlign: TextAlign.center,
              ),
              searchFiled(context, controller),
            ],
          ),
          actions: [
            // display alert dialog and update the sate according to the returned boolean value
            IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return MyAlertDialog();
                      }).then((_) {
                    setState(() {});
                  });
                }),
          ],
        ),
        body: SingleChildScrollView(
          //display a list of all position from github and usagov
          child: PositionList(),
        ),
      ),
    );
  }


}

