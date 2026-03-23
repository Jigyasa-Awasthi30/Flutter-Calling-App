import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/call_provider.dart';

class ActiveCallScreen extends StatefulWidget {
  const ActiveCallScreen({super.key});
  @override
  _ActiveCallScreenState createState() => _ActiveCallScreenState();
}

class _ActiveCallScreenState extends State<ActiveCallScreen> {
  int seconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds++);
    });
  }

  String formatTime(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return "$m:$sec";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CallProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1F1C2C),
              Color(0xFF928DAB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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

              //  Number
              Text(
                provider.number,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),

              SizedBox(height: 20),

              // ⏱ Timer
              Text(
                formatTime(seconds),
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 50),

              //  Controls Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildControlButton(
                    icon: Icons.mic_off,
                    label: "Mute",
                    active: provider.isMuted,
                    onTap: provider.toggleMute,
                  ),
                  _buildControlButton(
                    icon: Icons.volume_up,
                    label: "Speaker",
                    active: provider.isSpeakerOn,
                    onTap: provider.toggleSpeaker,
                  ),
                  _buildControlButton(
                    icon: Icons.call_end,
                    label: "End",
                    isEnd: true,
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

  // 3D Control Button
  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool active = false,
    bool isEnd = false,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isEnd
                  ? Colors.red
                  : active
                  ? Colors.green
                  : Colors.white24,
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
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}