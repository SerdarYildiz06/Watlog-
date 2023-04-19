import 'package:flutter/material.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        actions: const [],
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: const Text('Chat with us'),
      ),
    );
  }
}
