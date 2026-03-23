import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Rahul", "number": "9876543210"},
    {"name": "Priya", "number": "9123456780"},
    {"name": "Amit", "number": "9988776655"},
    {"name": "Neha", "number": "9012345678"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (_, index) {
          final contact = contacts[index];

          return ListTile(
            leading: CircleAvatar(
              child: Text(contact["name"]![0]),
            ),
            title: Text(contact["name"]!),
            subtitle: Text(contact["number"]!),
            trailing: Icon(Icons.call),

            // Select contact
            onTap: () {
              Navigator.pop(context, contact["number"]);
            },
          );
        },
      ),
    );
  }
}