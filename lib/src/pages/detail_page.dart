import 'dart:ui';

import 'package:flutter/material.dart';

List<Widget> getList(avengers) {
  List<Widget> childs = [];

  for (String key in avengers.keys) {
    childs.add(new Text('${key}:  ${avengers[key]}',
        style: TextStyle(color: Colors.white70)));
  }
  return childs;
}

class DetailPage extends StatelessWidget {
  final avenger;

  const DetailPage({required this.avenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${avenger['name']}'),
              background: Hero(
                tag: '${avenger['id']}',
                child: Image.network(
                  '${avenger['images']['lg']}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(24),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('Full name:  ',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('${avenger['biography']['fullName']}',
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Text('\n'),
                      Row(
                        children: [
                          Text('Slug:  ',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('${avenger['slug']}',
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Text('\n'),
                      Row(
                        children: [
                          Text('Gender:  ',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('${avenger['appearance']['gender']}',
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Text('\n'),
                      Row(
                        children: [
                          Text('Race:  ',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          Text('${avenger['appearance']['race']}',
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Text('\n'),
                      Row(
                        children: [
                          Text('Occupation:  ',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                        ],
                      ),
                      Text('${avenger['work']['occupation']}',
                          style: TextStyle(color: Colors.white70)),
                      Text('\n\n---------------------------------------------------------------------------------------------',
                          style: TextStyle(color: Colors.white70)),
                      Text(
                        '\n\nPowerstats:',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      ...getList(avenger['powerstats']),
                      Text(
                        '\n\nBiography:',
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      ...getList(avenger['biography']),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
