import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchlist_media/services/services.dart';

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({super.key});

  @override
  State<DevelopersPage> createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  TextEditingController searchTF = TextEditingController();
  String searchOP = '';
  String searchImg = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEV PAGE, TESTING STUFF OUT"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(),

              // SEARCH 
              Row(
                children: [
                  Expanded(child: TextField(controller: searchTF, decoration: const InputDecoration(hintText: 'Search'), autocorrect: false,)),
                  TextButton(
                    onPressed: () async{

                      setState(() {
                        loading = true;
                      });

                      dynamic temp =  await APIService.searchAll(searchTF.text);

                      temp['results'].length != 0?

                      setState(() {
                        searchOP = temp['results'][0]['original_name'] + '\n' + temp['results'][0]['overview'].toString();
                        searchImg = temp['results'][0]['poster_path'].toString();
                        searchImg = 'https://image.tmdb.org/t/p/original/$searchImg';
                        loading = false;
                      }):null;
                    },
                    child: const Icon(CupertinoIcons.arrow_right)
                  )
                ],
              ),

            // SEARCH OUTPUT

            loading?LinearProgressIndicator():SizedBox(),

            Text(
              searchOP
            ),
            searchImg!=''?
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(image: NetworkImage(searchImg), fit: BoxFit.cover)
              ),
            ):SizedBox(),

            ],
          ),
        ),
      )
    );
  }
}


