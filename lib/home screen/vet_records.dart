import 'package:flutter/material.dart';

class VetRecordsScreen extends StatefulWidget {
  @override
  _VetRecordsScreenState createState() => _VetRecordsScreenState();
}

class _VetRecordsScreenState extends State<VetRecordsScreen> {
  List<String> _uploadedRecords = [];

  void _uploadRecord() async {
    // TODO: Implement file picker and upload logic
    setState(() {
      _uploadedRecords.add("Vet Record ${_uploadedRecords.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vet Records"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _uploadRecord,
            child: Text("Upload Vet Record"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _uploadedRecords.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_uploadedRecords[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}