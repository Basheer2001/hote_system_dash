import 'package:flutter/material.dart';

class DynamicServiceScreen extends StatefulWidget {
  final int serviceId;

  DynamicServiceScreen({required this.serviceId});

  @override
  _DynamicServiceScreenState createState() => _DynamicServiceScreenState();
}

class _DynamicServiceScreenState extends State<DynamicServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Service ${widget.serviceId}")),
      body: Center(
        child: Text("Service ID: ${widget.serviceId}"),
      ),
    );
  }
}
