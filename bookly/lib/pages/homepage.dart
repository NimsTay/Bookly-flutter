import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_nav.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        bottomNavigationBar: BottomNav(),
        body: Column(
          children: [Text("HEllow oreld")]
        )
      )
    );
  }
}