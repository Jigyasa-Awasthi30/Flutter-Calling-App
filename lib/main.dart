import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/call_provider.dart';
import 'models/call_state.dart';
import 'screens/dial_pad_screen.dart';
import 'screens/outgoing_call_screen.dart';
import 'screens/incoming_call_screen.dart';
import 'screens/active_call_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CallProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<CallProvider>(
        builder: (context, provider, _) {
          switch (provider.state) {
            case CallState.calling:
              return OutgoingCallScreen();
            case CallState.ringing:
              return IncomingCallScreen();
            case CallState.active:
              return ActiveCallScreen();
            case CallState.ended:
              provider.reset();
              return DialPadScreen();
            default:
              return DialPadScreen();
          }
        },
      ),
    );
  }
}