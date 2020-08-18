import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello/hello.dart';

void main() {
  runApp(
    EasyLocalization(
      path: 'assets/translations/',
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'DZ'),

      ],
      //fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("${EasyLocalization.of(context).locale.toString()}");
    print(Intl.defaultLocale.toString() +
        this.toString() +
        "# ${Intl.defaultLocale}");
    return MaterialApp(
      title: 'title'.tr(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'title'.tr()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimpleText(
            locale: EasyLocalization.of(context).locale,
          ),
          Text('clickMe').tr(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  EasyLocalization.of(context).locale = Locale('ar', 'DZ');
                });
              },
              child: Center(
                child: Text('Arabic'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  EasyLocalization.of(context).locale = Locale('en', 'US');
                });
              },
              child: Center(
                child: Text('English'),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
