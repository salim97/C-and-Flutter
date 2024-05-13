import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _responseBody = 'Response will be shown here';

  Future<void> _makePostRequest() async {
    // Set up the URL.
    final url = Uri.parse(_controller.text);
    
    // Await the http post response.
    final response = await http.post(url, body: {});

    // Update the UI with the response body.
    setState(() {
      _responseBody = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP POST Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter URL here',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _makePostRequest,
              child: Text('Send POST Request'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_responseBody),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
