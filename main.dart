import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CRUD Operations')),
        body: const Center(
          child: CRUDOperations(),
        ),
      ),
    );
  }
}

class CRUDOperations extends StatefulWidget {
  const CRUDOperations({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CRUDOperationsState createState() => _CRUDOperationsState();
}

class _CRUDOperationsState extends State<CRUDOperations> {
  String _output = '';

  Future<void> createPost() async {
    //sends a POST request to create a new post
    final response = await http.post(
      //sends post request to specified url
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: <String, String>{
        //specifies the content type as json
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        //encodes a map of data into a JSON string
        'title': 'foo',
        'body': 'bar',
        'userId': '1',
      }),
    );

    setState(() {
      if (response.statusCode == 201) {
        _output = 'Post created: ${response.body}';
      } else {
        _output = 'Failed to create post';
      }
    });
  }

  Future<void> readPosts() async {
    //sends a GET request to fetch all posts
    //asynchronous method
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    //Sends a GET request to the specified URL

    setState(() {
      if (response.statusCode == 200) {
        List data = json
            .decode(response.body); //decodes JSON response into a list of data
        _output = 'Posts: ${data.length}';
      } else {
        _output = 'Failed to load posts';
      }
    });
  }

  Future<void> updatePost() async {
    //sends a PUT request to update an existing post with a specific ID
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': 'foo',
        'body': 'bar',
        'userId': '1',
      }),
    );

    setState(() {
      if (response.statusCode == 200) {
        _output = 'Post updated: ${response.body}';
      } else {
        _output = 'Failed to update post';
      }
    });
  }

  Future<void> patchPost() async {
    //sends a PATCH request to partially update an existing post
    final response = await http.patch(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': 'foo',
      }),
    );

    setState(() {
      if (response.statusCode == 200) {
        _output = 'Post patched: ${response.body}';
      } else {
        _output = 'Failed to patch post';
      }
    });
  }

  Future<void> deletePost() async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    setState(() {
      if (response.statusCode == 200) {
        _output = 'Post deleted';
      } else {
        _output = 'Failed to delete post';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: createPost,
          child: const Text('Create Post'),
        ),
        ElevatedButton(
          onPressed: readPosts,
          child: const Text('Read Posts'),
        ),
        ElevatedButton(
          onPressed: updatePost,
          child: const Text('Update Post'),
        ),
        ElevatedButton(
          onPressed: patchPost,
          child: const Text('Patch Post'),
        ),
        ElevatedButton(
          onPressed: deletePost,
          child: const Text('Delete Post'),
        ),
        const SizedBox(height: 20),
        Text(
          _output,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
