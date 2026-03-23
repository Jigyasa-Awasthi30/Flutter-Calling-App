import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/call_provider.dart';

class IncomingCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CallProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF434343),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 📞 Incoming Call Text
              Text(
                "Incoming Call",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // 👤 Caller Name
              Text(
                provider.callerName,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
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

              SizedBox(height: 50),

              // 🔘 Accept / Reject Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCallButton(
                    icon: Icons.call,
                    label: "Accept",
                    color: Colors.green,
                    onTap: provider.acceptCall,
                  ),
                  _buildCallButton(
                    icon: Icons.call_end,
                    label: "Reject",
                    color: Colors.red,
                    onTap: provider.endCall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔘 3D Button Widget
  Widget _buildCallButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 8,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}