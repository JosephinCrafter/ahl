import 'package:ahl/src/home/hero_header/hero_header.dart';
import 'package:flutter/material.dart';

/// Home page

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          drawer: constraints.maxWidth <= 600 ? const Drawer() : null,
          appBar: AppBar(),

          // Here are placed all components that build the entire
          // HomePage
          body: ListView(
            children: const [
              HeroHeaderView(),
            ],
          ),
        );
      },
    );
  }
}
