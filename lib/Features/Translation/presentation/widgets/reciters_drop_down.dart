import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuranRecitersDropdown extends StatelessWidget {
  final String apiUrl;

  QuranRecitersDropdown({required this.apiUrl});

  Future<List<String>> _fetchRecitersNames() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> recitersNames = List<String>.from(data["data"].map((reciter) {
        return reciter["englishName"];
      }));
      return recitersNames;
    } else {
      throw Exception('Failed to load reciters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _fetchRecitersNames(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container( // Wrap the DropdownButton with a Container to provide a fixed width
            width: 200, // Set the desired width for the DropdownButton
            child: DropdownButton<String>(
              items: snapshot.data?.map((reciterName) {
                    return DropdownMenuItem<String>(
                      value: reciterName,
                      child: Text(reciterName),
                    );
                  }).toList() ??
                  [],
              onChanged: (selectedReciter) {
                // Handle the selected reciter here
                print("reciter: $selectedReciter");
              },
              hint: Text('Select Reciter'),
              isExpanded: true,
            ),
          );
        }
      },
    );
  }
}

// Usage
// Call this widget in your Flutter app providing the API URL as follows:
// QuranRecitersDropdown(apiUrl: "https://your-api-endpoint.com/reciters");
