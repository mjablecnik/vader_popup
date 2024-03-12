import 'package:example/button.dart';
import 'package:example/test_data.dart';
import 'package:flutter/material.dart';
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
    final dialog = PopupDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 10,
            children: <Widget>[
              Button(
                text: "Show input dialog",
                color: Colors.brown,
                onPressed: () async {
                  dialog.input(
                    context,
                    title: "Input dialog",
                    message: "Zadejte vaše jméno",
                    label: "Jméno",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ).then(print);
                },
              ),
              Button(
                text: "Dialog with long message",
                color: Colors.purple,
                onPressed: () async {
                  dialog
                      .info(
                        title: "Long message dialog",
                        message: longMessage,
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Choose from more options",
                color: Colors.pink,
                onPressed: () async {
                  dialog.choose(
                    title: "Choose dialog",
                    message: "Choose one option:",
                    options: [
                      PopupOption(
                        label: "Always",
                        value: "always",
                        color: Colors.green.shade800,
                      ),
                      const PopupOption(
                        label: "Yes",
                        value: "yes",
                        color: Colors.green,
                      ),
                      const PopupOption(
                        label: "Maybe",
                        value: "maybe",
                        color: Colors.orangeAccent,
                      ),
                      const PopupOption(
                        label: "No",
                        value: "no",
                        color: Colors.red,
                      ),
                      PopupOption(
                        label: "Never",
                        value: "never",
                        color: Colors.red.shade800,
                      ),
                    ],
                  ).then(print);
                },
              ),
              Button(
                text: "Show info popup dialog",
                onPressed: () async {
                  dialog
                      .info(
                        title: "Info dialog",
                        message: "Zásilku nelze přesměrovat na výdejní místo.",
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Show success popup dialog",
                color: Colors.green,
                onPressed: () async {
                  dialog
                      .success(
                        title: "Success dialog",
                        message: "Zásilku lze přesměrovat na výdejní místo.",
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Show warning popup dialog",
                color: Colors.orange,
                onPressed: () async {
                  dialog
                      .warning(
                        title: "Warning dialog",
                        message: "Zásilku lze přesměrovat na výdejní místo.",
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Show error popup dialog",
                color: Colors.red,
                onPressed: () async {
                  dialog
                      .error(
                        title: "Error dialog",
                        message: "Zásilku nelze přesměrovat na výdejní místo.",
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Show question popup dialog",
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  dialog
                      .question(
                        title: "Question dialog",
                        message: "Chcete zásilku přesměrovat na výdejní místo?",
                      )
                      .then(print);
                },
              ),
              Button(
                text: "Show custom popup dialog",
                onPressed: () async {
                  final result = await PopupDialog(
                    context: context,
                    header: const PopupHeader(
                      icon: Icon(Icons.info, color: Colors.blue, size: 70),
                      title: PopupText(
                        text: "Info dialog",
                      ),
                    ),
                    content: const PopupMessage(
                      message: PopupText(text: "Zásilku nelze přesměrovat na výdejní místo."),
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
                  ).show(context);
                  print(result);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
