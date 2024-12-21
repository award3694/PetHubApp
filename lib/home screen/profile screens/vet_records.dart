import 'package:flutter/material.dart';

class VetRecordsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vet Records"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Implement the file upload functionality
              },
              child: Text("Upload Vet Record"),
            ),
            SizedBox(height: 20),
            Text(
              "No records uploaded yet.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}