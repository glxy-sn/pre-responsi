import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lat_responsi/karakter/detail_karakter.dart';

class Char{
  final String name;
  // final String skillTalents;
   Char({
     required this.name,
     // required this.skillTalents
   });

   factory Char.fromJson(String json){
     return Char(
         name: json,
         // skillTalents: json
     );
   }
}

class ListKarakter extends StatelessWidget {
  const ListKarakter({Key? key}) : super(key: key);
  Future<List<Char>> fetchChar() async {
    final response = await http.get(Uri.parse('https://api.genshin.dev/characters'));
    if (response.statusCode == 200) {
      final List<String> data = json.decode(response.body).cast<String>();
      final char = data.map((json) => Char.fromJson(json)).toList();
      return char;
    } else {
      throw Exception('Failed to fetch weapons');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact Characters'),
        backgroundColor: Color.fromRGBO(38, 58, 41, 1),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<Char>>(
          future: fetchChar(),
          builder: (context, snapshot){
            if (snapshot.hasData){
              final char = snapshot.data!;
              return ListView.builder(
                itemCount: char.length,
                  itemBuilder: (context, index){
                    final character = char[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CharDetail(
                              name: character.name,
                              // skillTalents: character.skillTalents,
                            ))
                        );
                      },
                      child: Card(
                        child: Row(
                          children: [
                              Container(
                                width: 100,
                                child: Image.network('https://api.genshin.dev/characters/' + character.name + '/icon-big'),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(character.name.toUpperCase()),
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }else if(snapshot.hasError){
                return Text('Error: ${snapshot.error}');
              }
            return CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}





