import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60.0,
          left: 40.0,
          right: 40.0,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Center(
                child: Image.asset("assets/02.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
