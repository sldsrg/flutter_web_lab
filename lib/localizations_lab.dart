import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class LocalizationsLabPage extends StatefulWidget {
  @override
  _LocalizationsLabPageState createState() => _LocalizationsLabPageState();
}

class _LocalizationsLabPageState extends State<LocalizationsLabPage> {
  Locale _locale = Locale('ru');
  int _numOfMessages = 0;

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: _locale,
      delegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      child: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text("Localizations lab"),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).localeHint),
                    DropdownButton(
                      value: _locale,
                      items: S.delegate.supportedLocales
                          .map<DropdownMenuItem<Locale>>(
                            (Locale locale) => DropdownMenuItem<Locale>(
                              value: locale,
                              child: Text(locale.toString()),
                            ),
                          )
                          .toList(),
                      onChanged: (Locale locale) {
                        setState(() {
                          _locale = locale;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).numOfMessages),
                    SizedBox(
                      width: 24,
                      child: TextFormField(
                        initialValue: _numOfMessages.toString(),
                        textAlign: TextAlign.center,
                        onChanged: (String value) {
                          setState(() {
                            _numOfMessages = int.parse(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.0),
                Text(
                  S.of(context).greeting,
                  textScaleFactor: 2.5,
                ),
                SizedBox(height: 6),
                Text(
                  S.of(context).newMessages(_numOfMessages),
                  textScaleFactor: 1.5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
