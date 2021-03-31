import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musical/model/musics.dart';
import 'package:musical/widgets/songList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final musicJson = await rootBundle.loadString("assets/files/musics.json");
    final decodedData = jsonDecode(musicJson);
    var musicsData = decodedData["musics"];
    CatalogMusic.songs = List.from(musicsData)
        .map<Music>((song) => Music.fromMap(song))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (CatalogMusic.songs != null && CatalogMusic.songs.isNotEmpty)
            SongsList()
          else
            Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
