import 'package:flutter/material.dart';
import 'package:musical/model/musics.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogMusic.songs.length,
        itemBuilder: (context, index) {
          final songs = CatalogMusic.songs[index];
          return InkWell(
            child: SongsItem(songs: songs),
          );
        },
      ),
    );
  }
}

class SongsItem extends StatelessWidget {
  final Music songs;

  const SongsItem({Key key, this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 15.0, top: 10.0, bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                songs.thumnail,
                height: 70.0,
                width: 70.0,
              ),
              Text(
                songs.title,
                maxLines: 2,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.play_arrow),
            ],
          ),
        )
      ],
    );
  }
}
