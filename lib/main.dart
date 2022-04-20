import 'package:flutter/material.dart';
import 'package:flutter_connectivity_network_sensitive_app/connectivity_service.dart';
import 'package:flutter_connectivity_network_sensitive_app/connectivity_widget.dart';
import 'package:flutter_connectivity_network_sensitive_app/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ConnectivityService _connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    debugPrint("App Initialize");
  }

  @override
  void dispose() {
    _connectivityService.dispose();
    debugPrint("App dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>(
          create: (context) =>
              _connectivityService.connectionStatusController?.stream,
          initialData: ConnectivityStatus.offline,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netowrk Sensitive App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const ConnectivityWidget(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
