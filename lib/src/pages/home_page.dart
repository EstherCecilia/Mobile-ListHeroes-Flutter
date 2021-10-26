import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/detail_page.dart';



class HomePage extends StatelessWidget {
  final List avengers;


  const HomePage({required this.avengers});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text("Super Simple Hero Animation"), backgroundColor: Colors.blueGrey,),
      body:ListView.builder(
          itemCount: avengers.length,
          itemBuilder: (context, index) {
            var avenger = avengers[index];
            return ListTile(
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300.0),
                  child: Hero(
                    tag: "avatar-$index",
                    child: Image.network('${avenger['images']['lg']}'),
                  ),
                ),
              ),
              title: Text('${avenger['name']}', style: TextStyle(color: Colors.white70),),
              onTap: () => _openDetail(context, avenger),
            );
          }),
    );
  }

  _openDetail(context, avenger) {
    final route = MaterialPageRoute(
      builder: (context) => DetailPage(avenger: avenger),
    );
    Navigator.push(context, route);
  }
}
