import 'package:flutter/material.dart';
import '../models/call_state.dart';

class CallProvider extends ChangeNotifier {
  // Call State
  CallState _state = CallState.idle;

  // Call Data
  String _number = "";
  String _callerName = "Unknown";

  //  Controls
  bool _isMuted = false;
  bool _isSpeakerOn = false;

  // ================= GETTERS =================
  CallState get state => _state;
  String get number => _number;
  String get callerName => _callerName;
  bool get isMuted => _isMuted;
  bool get isSpeakerOn => _isSpeakerOn;

  // ================= DIAL PAD =================

  // ➕ Add digit
  void addDigit(String digit) {
    _number += digit;
    notifyListeners();
  }

  // Delete last digit
  void deleteDigit() {
    if (_number.isNotEmpty) {
      _number = _number.substring(0, _number.length - 1);
      notifyListeners();
    }
  }

  //  Set number from contacts
  void updateNumber(String num, {String name = "Unknown"}) {
    _number = num;
    _callerName = name;
    notifyListeners();
  }

  // ================= CALL FLOW =================

  // Start outgoing call
  void startCall() {
    if (_number.isEmpty) return;

    _state = CallState.calling;
    notifyListeners();
  }

  // Simulate incoming call
  void incomingCall({
    String number = "9876543210",
    String name = "Unknown",
  }) {
    _number = number;
    _callerName = name;
    _state = CallState.ringing;
    notifyListeners();
  }

  // Accept incoming call
  void acceptCall() {
    _state = CallState.active;
    notifyListeners();
  }

  // End call
  void endCall() {
    _state = CallState.ended;

    // Reset controls after call
    _isMuted = false;
    _isSpeakerOn = false;

    notifyListeners();
  }

  // Reset everything
  void reset() {
    _state = CallState.idle;
    _number = "";
    _callerName = "Unknown";
    _isMuted = false;
    _isSpeakerOn = false;

    notifyListeners();
  }

  // ================= CONTROLS =================

  // Toggle mute
  void toggleMute() {
    _isMuted = !_isMuted;
    notifyListeners();
  }

  // 🔊 Toggle speaker
  void toggleSpeaker() {
    _isSpeakerOn = !_isSpeakerOn;
    notifyListeners();
  }
}