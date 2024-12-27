import 'package:crisp/crisp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CrispMain crispMain;

  static const String CRISP_CHAT_DEVELOPMENT_KEY =
      "a7ae4383-796d-4094-9b09-84c2ce69c394";

  static const String CRISP_CHAT_PRODUCTION_KEY =
      "7cc44f6d-29de-4a1a-9ac6-2211adbba7e9";

  @override
  void initState() {
    super.initState();


    crispMain = CrispMain(
      websiteId: CRISP_CHAT_DEVELOPMENT_KEY,
      userToken: "kfdjalkdfjkf"
      // locale: 'pt-br',
    );

    crispMain.register(
      user: CrispUser(
        email: "leo@provider.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "João Cardoso",
        phone: "5511987654321",
      ),
    );

    crispMain.setMessage("Hello world");

    crispMain.setSessionData({
      "order_id": "111",
      "app_version": "0.1.1",
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your brand'),
        ),
        body: CrispView(
          crispMain: crispMain,
          clearCache: false,
        ),
      ),
    );
  }
}
