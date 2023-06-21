import 'dart:convert';
import 'package:flutter/material.dart';

class EpisodeTile extends StatefulWidget {
  const EpisodeTile({
    Key? key,
  }) : super(key: key);

  @override
  State<EpisodeTile> createState() => _EpisodeTileState();
}

class _EpisodeTileState extends State<EpisodeTile> {
  String details = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            onTap: () => Navigator.pushNamed(
              context,
              '/videoscreen',
              arguments: json.encode(
                {'title': "title", 'videoUrl': ''},
              ),
            ),
            leading: Image.network(
              "",
              fit: BoxFit.cover,
              height: 70,
              width: 100,
            ),
            title: const Text("widget.episode.title!"),
            subtitle: const Text('23m  22'),
            trailing: const Icon(Icons.download_sharp),
          ),
          FutureBuilder(
              future: Future.value("john wick"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  details = snapshot.data.toString();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Text(
                    details,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              })
        ],
      ),
    );
  }
}
