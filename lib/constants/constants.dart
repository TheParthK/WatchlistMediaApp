import 'package:flutter/material.dart';

const Color lightColor = Color.fromARGB(255, 225, 224, 218);

String fullImgPath(String posterPath){
  return 'https://image.tmdb.org/t/p/original/$posterPath';
}



const String mov1 = "https://i.pinimg.com/1200x/49/dc/7f/49dc7fd13ea6a99e9fd2cceee3ba398e.jpg";
const String mov2 = "https://i.pinimg.com/1200x/71/26/d0/7126d0f9850625a60a03a37c0a600fa4.jpg";
const String mov3 = "https://i.pinimg.com/1200x/8c/9c/50/8c9c507d71317328576b81cdeb402868.jpg";
const String mov4 = "https://i.pinimg.com/1200x/e4/d8/48/e4d8480fc51929709d5054332fc6b912.jpg";


const String sci1 = "https://i.pinimg.com/1200x/76/b0/44/76b0441bab36032fe37550ba8937cf3f.jpg";
const String sci2 = "https://i.pinimg.com/1200x/6c/09/38/6c0938c9e130c9d95b29c2ee5eeb40b6.jpg";
const String sci3 = "https://i.pinimg.com/1200x/41/16/d3/4116d3fe45fb262d8f6d3ca4dd8c3f26.jpg";
const String sci4 = "https://i.pinimg.com/1200x/74/39/8a/74398a7c7b62b095a108dbfb41ffecd6.jpg";

const LinearGradient loadingBG = 
    LinearGradient(
      begin: Alignment.topLeft, end: Alignment.bottomRight,
      colors: [Colors.grey, Colors.transparent]
    );