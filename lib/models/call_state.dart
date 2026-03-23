enum CallState {
  idle,
  dialing,     // user typing number
  calling,
  ringing,
  active,
  onHold,      // optional advanced
  ended
}