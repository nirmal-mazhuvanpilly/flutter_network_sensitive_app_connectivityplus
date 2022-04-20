import 'package:flutter/material.dart';
import 'package:flutter_connectivity_network_sensitive_app/connectivity_service.dart';
import 'package:provider/provider.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget child;
  const ConnectivityWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityStatus>(
      builder: (_, value, __) {
        debugPrint(value.name);
        if (value == ConnectivityStatus.offline) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Offline!\nPlease check the connection",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}
