import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/call_provider.dart';

class OutgoingCallScreen extends StatelessWidget {
  const OutgoingCallScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CallProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF232526),
              Color(0xFF414345),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Calling Icon
              Icon(
                Icons.phone_in_talk,
                size: 80,
                color: Colors.greenAccent,
              ),

              SizedBox(height: 20),

              // 👤 Caller Name
              Text(
                provider.callerName,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              // 📱 Number
              Text(
                provider.number,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              SizedBox(height: 20),

              // 📡 Calling Text
              Text(
                "Calling...",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[300],
                  letterSpacing: 1.2,
                ),
              ),

              SizedBox(height: 50),

              // 🔘 End Call Button
              _buildEndCallButton(provider.endCall),
            ],
          ),
        ),
      ),
    );
  }

  // 3D End Call Button
  Widget _buildEndCallButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.call_end,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}