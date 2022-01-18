import 'package:flutter/material.dart';
import 'package:flutter_breaking/data/Models/characters.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);
  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickName,
          style: TextStyle(color: Colors.white),
        ),
        background: Hero(
            tag: character.charId,
            child: Image.network(character.image, fit: BoxFit.cover)),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
        color: Colors.yellow, height: 30, endIndent: endIndent, thickness: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Job: ', character.jobs.join(' / ')),
                  buildDivider(330),
                  characterInfo(
                      'Appeared in: ', character.categoryForTwoSeries),
                  buildDivider(270),
                  characterInfo(
                      'Seasons: ', character.appearanceOfSeasons.join(' / ')),
                  buildDivider(300),
                  characterInfo('status: ', character.statusIfDeadorALive),
                  buildDivider(300),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container()
                      : characterInfo('Better Call Saul Seasons: ',
                          character.betterCallSaulAppearance.join(" / ")),
                  character.betterCallSaulAppearance.isEmpty
                      ? Container() :
                  buildDivider(190),
                  characterInfo('Actor/Actress : ', character.actorname),
                  buildDivider(260),
                  // to increase space to better scroll
                  SizedBox(height: 20)
                ],
              ),
            ),
                SizedBox(height: 500,)

              ])
              //  sliverList(delegate:
              )
        ],
      ),
    );
  }
}

