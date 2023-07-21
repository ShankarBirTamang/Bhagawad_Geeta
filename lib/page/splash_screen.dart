import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geeta_sutra/request/token.dart';
import 'package:http/http.dart' as http;


String token = '';

class PostClass extends StatefulWidget {
  const PostClass({super.key});

  @override
  State<PostClass> createState() => _PostClassState();
}

class _PostClassState extends State<PostClass> {
  Future<bool> postData() async {
    var url = "https://bhagavadgita.io/auth/oauth/token";
    http.Response response = await http.post(Uri.parse(url), body: {
      'client_id': 'qeO7Zah55fHCyvV93rkYSqjXWnsYh2thI1yVnqQn',
      'client_secret': 'qJpgHv7af7H6SL4zaeTFIZPC3ydkvWKM3qqB4DrJDvuBhFGV6Q',
      'grant_type': 'client_credentials',
      'scope': ' verse chapter '
    });
    // print(response.statusCode);
    if (response.statusCode == 200) {
      RequestToken requestToken = requestTokenFromJson(response.body);
      token = requestToken.accessToken;
      // print(token);
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    postData().then((value) {
      if (value == true) {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushNamed("/chapter"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: Image.asset('assets/images/kris.png',
              height: 300, width: 250),
        ),
      )),
    );
  }
}
