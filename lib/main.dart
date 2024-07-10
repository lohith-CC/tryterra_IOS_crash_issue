import 'package:flutter/material.dart';
import 'package:terra_flutter_bridge/models/enums.dart';

import 'services/imp/tryterra_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Terra IOS Crash Issue'),
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

  onTryTerraSDKSourceClick() async {
    try {
      Connection connection = Connection.appleHealth;
      var isInitSuccessful = await TryTerraDataBrokerService()
          .initTerra('Y7sAgMDJAVfq560PwAgmIqi3X8C2');
      var connectionDetails =
          await TryTerraDataBrokerService().initConnection(connection);
      if (isInitSuccessful &&
          connectionDetails.success != null &&
          connectionDetails.success! &&
          connectionDetails.error == null) {
        try {
          await TryTerraDataBrokerService().getActivity(connection);
          await TryTerraDataBrokerService().getDaily(connection);
          await TryTerraDataBrokerService().getSleep(connection);
          await TryTerraDataBrokerService().getBody(connection);
          await TryTerraDataBrokerService().getNutrition(connection);
        } catch (e) {
          print(e.toString());
        }
      } else {
        print(connectionDetails.error.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () async{
                await onTryTerraSDKSourceClick();
              },
              child: Container(
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text("Authorize Apple Health"),
                ),
              ),
            )
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
