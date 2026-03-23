# Flutter Calling App (UI + Call Flow Simulation)

A Flutter-based calling application that simulates real-world call interactions using structured state management and a clean user interface. This project demonstrates core competencies in Flutter development, UI design, and application state handling.

---

## Overview

This application replicates a basic phone calling experience, including:

* Dialing numbers through a keypad interface
* Handling outgoing and incoming call flows
* Managing an active call session with a live timer
* Providing UI-based call controls such as mute and speaker

Note: This application is a simulation and does not include real telephony or network integration.

---

## Features

### Dial Pad

* Numeric keypad (0–9, *, #)
* Real-time number input display
* Backspace functionality
* Call initiation

### Outgoing Call Screen

* Displays caller name and number
* Call status indicator ("Calling...")
* End call functionality

### Incoming Call Screen

* Simulated incoming call handling
* Displays caller name and number
* Accept and reject options

### Active Call Screen

* Live call duration timer
* Mute and speaker toggle (UI state)
* End call functionality

---

## UI and User Experience

* Gradient-based modern interface design
* Interactive dial pad with press animations
* Smooth transitions between call states
* Clean and responsive layout
* Consistent design across screens

---

## Architecture and Design

* State Management: Provider
* Architecture Pattern: MVVM (basic implementation)
* Navigation: State-driven screen rendering

The project emphasizes:

* Separation of concerns
* Maintainable and readable code
* Scalable state management

---

## Tech Stack

* Flutter (Dart)
* Provider (State Management)
* Material Design Components

---

## Project Structure

```
lib/
├── models/
│   └── call_state.dart
├── viewmodel/
│   └── call_provider.dart
├── screens/
│   ├── dial_pad_screen.dart
│   ├── outgoing_call_screen.dart
│   ├── incoming_call_screen.dart
│   ├── active_call_screen.dart
│   └── contact_screen.dart
└── main.dart
```

---

## Getting Started

### Clone the Repository

```
git clone https://github.com/your-username/calling_app.git
cd calling_app
```

### Install Dependencies

```
flutter pub get
```

### Run the Application

```
flutter run
```

---

## Build APK

```
flutter build apk
```

---

## Key Highlights

* Demonstrates structured Flutter application development
* Implements effective state management using Provider
* Handles multi-screen navigation and UI state transitions
* Maintains clean architecture and modular design
* Focuses on user experience and responsive UI

---

## Additional Implementations

* Contact list integration
* Animated dial pad interactions
* UI-based call controls (mute and speaker)

---

## Future Enhancements

* Integration with real calling or VoIP services
* Contact synchronization
* Call history and logs
* Theme customization (light/dark mode)

---

## Author

Jigyasa Awasthi

Flutter Developer | Aspiring AI Engineer

GitHub: https://github.com/Jigyasa-Awasthi30

---

## License

This project is intended for educational and demonstration purposes.

---
