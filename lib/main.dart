import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _makeGetRequest() async {
    // make GET request
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    Response response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    
    // TODO convert json to object...

    print(response.body);
    print(response.statusCode);
    
  }

  _makePostRequest() async {
    // set up POST request arguments
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"title": "Hello", "body": "body text", "userId": 1}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    print(response.body);
    print(response.statusCode);
    // }
  }

  // _makePutRequest() async {
  //   // set up PUT request arguments
  //   String url = 'https://jsonplaceholder.typicode.com/posts/1';
  //   Map<String, String> headers = {"Content-type": "application/json"};
  //   String json = '{"title": "Hello", "body": "body text", "userId": 1}';
  //   // make PUT request
  //   Response response = await put(url, headers: headers, body: json);
  //   // check the status code for the result
  //   int statusCode = response.statusCode;
  //   // this API passes back the updated item with the id added
  //   String body = response.body;
  //   // {
  //   //   "title": "Hello",
  //   //   "body": "body text",
  //   //   "userId": 1,
  //   //   "id": 1
  //   // }
  // }

  _makeDeleteRequest() async {
    // post 1
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    // make DELETE request
    Response response = await delete(url);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(response.statusCode);
    print(response.body);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 3,
          title: Text(
            "CRUD",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _makeGetRequest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                          colors: [Color(0xFF90CAF9), Color(0xFFDE93C8)])),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 200.0, maxHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "GET",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: _makePostRequest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                          colors: [Color(0xFF90CAF9), Color(0xFFDE93C8)])),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 200.0, maxHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "POST",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed:_makeDeleteRequest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: LinearGradient(
                          colors: [Color(0xFF90CAF9), Color(0xFFDE93C8)])),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 200.0, maxHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "DELETE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
