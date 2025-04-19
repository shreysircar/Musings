import 'dart:convert';
import 'package:http/http.dart' as http;

class YouTubeAPIService {
  static const String apiKey = "AIzaSyA9d-nTcyF6NrFtWCyOVHEktzFILdGHKV8";  // Replace with your actual API key

  static Future<String?> fetchMusicVideo(String songName) async {
    String query = Uri.encodeComponent("$songName official music video");
    String url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['items'].isNotEmpty) {
        return "https://www.youtube.com/watch?v=${data['items'][0]['id']['videoId']}";
      }
    }
    return null; // Return null if no video is found
  }
}
