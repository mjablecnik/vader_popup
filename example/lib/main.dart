import 'package:art_buttons_kh/art_buttons_kh.dart';
import 'package:example/button.dart';
import 'package:flutter/material.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/parts/content.dart';
import 'package:vader_popup/parts/header.dart';
import 'package:vader_popup/vader_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          children: <Widget>[
            Button(
              text: "Show info popup dialog",
              onPressed: () async {
                VaderPopup.info(
                  context,
                  title: "Info dialog",
                  message: "Zásilku nelze přesměrovat na výdejní místo.",
                ).then(print);
              },
            ),
            Button(
              text: "Show success popup dialog",
              color: Colors.green,
              onPressed: () async {
                VaderPopup.success(
                  context,
                  title: "Success dialog",
                  message: "Zásilku lze přesměrovat na výdejní místo.",
                ).then(print);
              },
            ),
            Button(
              text: "Show warning popup dialog",
              color: Colors.orange,
              onPressed: () async {
                VaderPopup.warning(
                  context,
                  title: "Warning dialog",
                  message: "Zásilku lze přesměrovat na výdejní místo.",
                ).then(print);
              },
            ),
            Button(
              text: "Show error popup dialog",
              color: Colors.red,
              onPressed: () async {
                VaderPopup.error(
                  context,
                  title: "Error dialog",
                  message: "Zásilku nelze přesměrovat na výdejní místo.",
                ).then(print);
              },
            ),
            Button(
              text: "Show custom popup dialog",
              onPressed: () async {
                final result = await VaderPopup.customDialog(
                  context: context,
                  header: const PopupHeader(
                    icon: Icon(Icons.info, color: Colors.blue, size: 70),
                    title: PopupText(
                      text: "Info dialog",
                    ),
                  ),
                  content: const PopupMessage(
                    text: PopupText(text: "Zásilku nelze přesměrovat na výdejní místo."),
                  ),
                  buttons: [
                    PopupButton(
                      label: "Cancel",
                      color: Colors.grey.withOpacity(0.4),
                      onPressed: () {
                        Navigator.of(context).pop("Left button");
                      },
                    ),
                    PopupButton(
                      label: "OK",
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.of(context).pop("Right button");
                      },
                    ),
                  ],
                );
                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }
}
