import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;
  const AppLayout({super.key, required this.child, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
              child: Image.asset('assets/logos/smallLogo.png', width: 120),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
