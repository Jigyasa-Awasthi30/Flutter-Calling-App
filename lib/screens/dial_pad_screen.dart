import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/call_provider.dart';
import 'contact_screen.dart';

class DialPadScreen extends StatefulWidget {
  @override
  _DialPadScreenState createState() => _DialPadScreenState();
}

class _DialPadScreenState extends State<DialPadScreen> {
  final List<String> keys = [
    '1','2','3','4','5','6','7','8','9','*','0','#'
  ];

  @override
  void initState() {
    super.initState();

    //  Simulate incoming call after 5 seconds
    Future.delayed(Duration(seconds: 30), () {
      if (mounted) {
        Provider.of<CallProvider>(context, listen: false)
            .incomingCall(name: "Shruti", number: "9876543210");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CallProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30),

              //  Display
              Text(
                provider.number.isEmpty
                    ? "Enter Number"
                    : provider.number,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              SizedBox(height: 20),

              // Contact Button
              IconButton(
                icon: Icon(Icons.contacts, color: Colors.white, size: 28),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ContactScreen(),
                    ),
                  );

                  if (result != null) {
                    Provider.of<CallProvider>(context, listen: false)
                        .updateNumber(result);
                  }
                },
              ),

              //  Dial Pad
              Expanded(
                child: GridView.builder(
                  itemCount: keys.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (_, index) {
                    return DialButton(
                      text: keys[index],
                      onTap: () => provider.addDigit(keys[index]),
                    );
                  },
                ),
              ),

              //  Bottom Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.backspace, color: Colors.white),
                    onPressed: provider.deleteDigit,
                  ),

                  FloatingActionButton(
                    backgroundColor: Colors.green,
                    elevation: 10,
                    onPressed: provider.startCall,
                    child: Icon(Icons.call, size: 30),
                  ),
                ],
              ),

              SizedBox(height: 20),

              //  Manual Incoming Call Button (for demo)
              ElevatedButton(
                onPressed: () {
                  Provider.of<CallProvider>(context, listen: false)
                      .incomingCall(name: "Priya", number: "9123456780");
                },
                child: Text("Simulate Incoming Call"),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔘 3D ANIMATED DIAL BUTTON
//////////////////////////////////////////////////////////////

class DialButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const DialButton({required this.text, required this.onTap});

  @override
  _DialButtonState createState() => _DialButtonState();
}

class _DialButtonState extends State<DialButton> {
  double scale = 1.0;

  void _onTapDown(_) => setState(() => scale = 0.9);

  void _onTapUp(_) {
    setState(() => scale = 1.0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: scale,
        child: Container(
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xFF2C5364),
                Color(0xFF0F2027),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(4, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}