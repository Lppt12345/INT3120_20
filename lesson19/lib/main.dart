import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:intl/intl.dart';

import 'generated/intl/messages_all.dart';

void main() {
  runApp(const MyApp());
}

// class CustomLocalizations {
//   CustomLocalizations(this.locale);
//
//   final Locale locale;
//
//   static CustomLocalizations? of(BuildContext context) {
//     return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
//   }
//
//   static final Map<String, Map<String, String>> _resources = {
//     'en': {'title': 'Demo', 'message': 'Hello World'},
//     'vi': {
//       'title': 'Bài 19',
//       'message': 'Chào thế giới',
//     },
//   };
//
//   String? get title {
//     return _resources[locale.languageCode]!['title'];
//   }
//
//   String? get message {
//     return _resources[locale.languageCode]!['message'];
//   }
// }
//
// class CustomLocalizationsDelegate
//     extends LocalizationsDelegate<CustomLocalizations> {
//   const CustomLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);
//
//   @override
//   Future<CustomLocalizations> load(Locale locale) {
//     return SynchronousFuture<CustomLocalizations>(CustomLocalizations(locale));
//   }
//
//   @override
//   bool shouldReload(CustomLocalizationsDelegate old) => false;
// }

class CustomLocalizations {
  static Future<CustomLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return CustomLocalizations();
    });
  }

  static CustomLocalizations? of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  String get title {
    return Intl.message(
      'Demo',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get message {
    return Intl.message(
      'Hello World',
      name: 'message',
      desc: 'Message for the Demo application',
    );
  }
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return CustomLocalizations.load(locale);
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        const CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context)!.title.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              CustomLocalizations.of(context)!.message.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
