import 'package:flutter/material.dart';

class DefaultAppbarLayout extends StatefulWidget {
  final String title;
  final Widget child;

  DefaultAppbarLayout({
    required Widget child,
    required String title,
  })  : this.title = title,
        this.child = child;

  @override
  _DefaultAppbarLayoutState createState() => _DefaultAppbarLayoutState();
}

class _DefaultAppbarLayoutState extends State<DefaultAppbarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: widget.child,
    );
  }
}
