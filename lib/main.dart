import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/models/positions.dart';
import 'app/ui/my_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // a provider which provides access to the position from github and
    // usagov using the Positions class
    return ChangeNotifierProvider(
      create: (context) => Positions()..getPositions()
            ..getUsaPositions(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'JobHelper',
              home: MyHomePage(),
            ),
    );
  }
}
