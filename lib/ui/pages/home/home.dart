import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/pages/top_rate/top_rate.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Películas")),
      body: SafeArea(
          child: ListView(
        children: [
          ListTileOptions(
            title: "Películas de primera categoía",
            onTap: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => const TopRate()));
            },
          ),
          ListTileOptions(
            title: "To rate movies",
            onTap: () {},
          ),
        ],
      )),
    );
  }
}

class ListTileOptions extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ListTileOptions({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => onTap(),
    );
  }
}
