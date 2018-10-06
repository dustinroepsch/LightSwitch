import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Light Switch"),
      ),
      body: Column(
        children: <Widget>[_GiantButton()],
      ),
    );
  }
}

class _GiantButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
            child: SizedBox(
          width: 300.0,
          height: 300.0,
          child: FloatingActionButton(
              child: Icon(
                Icons.lightbulb_outline,
                size: 250.0,
              ),
              onPressed: () => {}),
        )));
  }
}
