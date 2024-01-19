import 'package:flutter/material.dart';
import './authenticationform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff6a5acd),
        title: const Text('Authentication',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
      ),
      body:
          const Align(alignment: Alignment.center, child: AuthenticationForm()),
    );
  }
}
