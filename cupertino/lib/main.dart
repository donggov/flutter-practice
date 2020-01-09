import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';         // NEW

import 'app.dart';
import 'model/app_state_model.dart';             // NEW

void main() {
  // This app is designed only to work vertically, so we limit
  // orientations to portrait up and down.
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // return runApp(CupertinoStoreApp());
  return runApp(
    ChangeNotifierProvider<AppStateModel>(
      create: (context) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(),
    ),
  );
}