import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatelessWidget {
  final String githubUrl =
      "https://github.com/objhaz"; // Replace with your GitHub URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            // Profile Picture
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assests/img.jpg'),
              ),
            ),

            // Your Name
            Text(
              'Joseph Obote',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Open GitHub Button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebViewPage(githubUrl),
                  ),
                );
              },
              child: Text('Open GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Profile'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
