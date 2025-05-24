import 'dart:core';
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:watchlist_media/constants/enums.dart';


class InfoModal{
  final String posterPath;
  final MediaType mediaType;
  final String originalTitle;
  final String title;
  final String id;
  final List<dynamic> genreIDs;
  final String overview;
  final String originalLang;
  final String releaseDate;
  final String voteAvg;
  final String voteCount;

  InfoModal({
    required this.posterPath,
    required this.originalTitle,
    required this.mediaType,
    required this.title,
    required this.id,
    required this.genreIDs,
    required this.overview,
    required this.originalLang,
    required this.releaseDate,
    required this.voteAvg,
    required this.voteCount
  });
}




class APIService{

  static Future<dynamic> searchAll(String searchTerm) async{
    searchTerm = searchTerm.split(' ').join("+");

    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/search/multi?query=$searchTerm'),
      headers: {"Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"}
    );
  
    return jsonDecode(response.body);
  }



  static Future <dynamic> discoverMulti() async{
    final Uri discoverMovieURL = Uri.parse("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc");
    final Uri discoverTvURL = Uri.parse("https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc");
    
    final List<InfoModal> results = <InfoModal>[];
    
    try {
      final responseMovie = await http.get(
        discoverMovieURL,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"
        }
      );
      final responseTv = await http.get(
        discoverTvURL,
        headers: {
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"
        }
      );

      dynamic dataMovie =  jsonDecode(responseMovie.body);
      dynamic dataTv =  jsonDecode(responseTv.body);

      for(var movie in dataMovie['results']){
        results.add(
          InfoModal(
            posterPath: movie['poster_path'] as String,
            originalTitle: movie['original_title'] as String,
            mediaType: MediaType.movie,
            title: movie['title'] as String,
            id: movie['id'].toString(),
            genreIDs: movie['genre_ids'],
            overview: movie['overview'] as String,
            originalLang: movie['original_language'] as String,
            releaseDate: movie['release_date'] as String,
            voteAvg: movie['vote_average'].toString(),
            voteCount: movie['vote_count'].toString()
          )
        );
      } 

    for(var tv in dataTv['results']){
      results.add(
          InfoModal(
            posterPath: tv['poster_path'] as String,
            originalTitle: tv['original_name'] as String,
            mediaType: MediaType.tv,
            title: tv['name'] as String,
            id: tv['id'].toString(),
            genreIDs: tv['genre_ids'],
            overview: tv['overview'] as String,
            originalLang: tv['original_language'] as String,
            releaseDate: tv['first_air_date'] as String,
            voteAvg: tv['vote_average'].toString(),
            voteCount: tv['vote_count'].toString()
          )
        );
    }

    } catch(e){
      print("error: $e");
    }

    results.shuffle();
    return results;
  }





  static Future<dynamic> topRatedMovies() async{
    Uri url = Uri.parse("https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1",);

    List<InfoModal> results = <InfoModal>[];

    try{
      final response = await http.get(
        url, 
        headers: {
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"
        }
      );

      dynamic data = jsonDecode(response.body);

      for(dynamic movie in data['results']){
        results.add(
          InfoModal(
            posterPath: movie['poster_path'] as String,
            originalTitle: movie['original_title'] as String,
            mediaType: MediaType.movie,
            title: movie['title'] as String,
            id: movie['id'].toString(),
            genreIDs: movie['genre_ids'],
            overview: movie['overview'] as String,
            originalLang: movie['original_language'] as String,
            releaseDate: movie['release_date'] as String,
            voteAvg: movie['vote_average'].toString(),
            voteCount: movie['vote_count'].toString()
          )
        );
      }

    } catch(e){
      print("error: $e");
    }

    return results;
  }

  static Future<dynamic> trendingMovies() async{
    Uri url = Uri.parse("https://api.themoviedb.org/3/trending/movie/day?language=en-US");


    List<InfoModal> results = <InfoModal>[];

    try{
      final response = await http.get(
        url,
        headers: {
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"
        }
      );

      dynamic data = jsonDecode(response.body);

      for(dynamic movie in data['results']){
        results.add(
          InfoModal(
            posterPath: movie['poster_path'] as String,
            originalTitle: movie['original_title'] as String,
            mediaType: MediaType.movie,
            title: movie['title'] as String,
            id: movie['id'].toString(),
            genreIDs: movie['genre_ids'],
            overview: movie['overview'] as String,
            originalLang: movie['original_language'] as String,
            releaseDate: movie['release_date'] as String,
            voteAvg: movie['vote_average'].toString(),
            voteCount: movie['vote_count'].toString()
          )
        );
      }

    } catch(e){
      print("Error: $e");
    }

    return results;
  }


  static Future<dynamic> popularTv() async{
    Uri url = Uri.parse("https://api.themoviedb.org/3/tv/popular?language=en-US&page=1");


    List<InfoModal> results = <InfoModal>[];

    try{
      final response = await http.get(
        url,
        headers: {
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTQxOTA0ZmFlODY4YWRhYmQyMzM3NTJmNGJhMGQxMCIsIm5iZiI6MTc0NzI5NjgyMS43NDMsInN1YiI6IjY4MjVhMjM1NGQ2YzEwMDVhZjc2N2NjMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9VAtQN8vMa8NzQ4WLBHOo9itX3QeJXX3gm79qXUyWXI"
        }
      );
      print(response.statusCode);
      print(response.body);
      dynamic data = jsonDecode(response.body);

    for(var tv in data['results']){
      results.add(
          InfoModal(
            posterPath: tv['poster_path'] as String,
            originalTitle: tv['original_name'] as String,
            mediaType: MediaType.tv,
            title: tv['name'] as String,
            id: tv['id'].toString(),
            genreIDs: tv['genre_ids'],
            overview: tv['overview'] as String,
            originalLang: tv['original_language'] as String,
            releaseDate: tv['first_air_date'] as String,
            voteAvg: tv['vote_average'].toString(),
            voteCount: tv['vote_count'].toString()
          )
        );
    }

    } catch(e){
      print("Error: $e");
    }

    return results;
  }


}