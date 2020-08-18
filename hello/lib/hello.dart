library hello;

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SimpleText extends StatelessWidget {
  final Locale locale;

  const SimpleText({Key key, @required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'title',
        style: Theme.of(context).textTheme.headline6,
      ).tr(),
    );
  }
}
