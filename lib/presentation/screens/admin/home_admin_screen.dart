import 'package:flutter/material.dart';

class HomeAdminScreen extends StatefulWidget {

  final String name;

  const HomeAdminScreen({super.key, required this.name});

  @override
  _HomeAdminScreenState createState() => _HomeAdminScreenState();

}

class _HomeAdminScreenState extends State<HomeAdminScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  closeScreen() {
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Admin'),
      ),
      body: const Center(
        child: Text('Home Admin'),
      ), // Center
    ); // Scaffold
  }
}
