import 'package:bookly/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ThemeColors.yellow,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(Icons.handshake_outlined, size: 200),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      "Bookly",
                      style: TextStyle(
                        fontSize: 80,
                        color: ThemeColors.purple
                      ),
                    ),
                    Text(
                      "The best way to find and book local services",
                      style: TextStyle(
                        color: ThemeColors.purple,
                        fontSize: 18
                      ),
                    )
                  ]
                )
              ) 
            ],
          ),
        )
      )
    );
  }
}