import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music/presentation/video_player/video_player_screen.dart';

class VideosTab extends StatefulWidget {
  @override
  _VideosTabState createState() => _VideosTabState();
}

class _VideosTabState extends State<VideosTab> {
  final String apiKey = "AIzaSyA9d-nTcyF6NrFtWCyOVHEktzFILdGHKV8";  // Replace with your valid API key
  List<Map<String, String>> videos = [];

  @override
  void initState() {
    super.initState();
    fetchMusicVideos("latest music"); // Fetch music videos on load
  }

  Future<void> fetchMusicVideos(String query) async {
    String url =
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=${Uri.encodeComponent(query)}&type=video&maxResults=10&key=$apiKey";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Map<String, String>> fetchedVideos = [];

      for (var item in data['items']) {
        fetchedVideos.add({
          "videoId": item['id']['videoId'],
          "title": item['snippet']['title'],
          "thumbnail": item['snippet']['thumbnails']['medium']['url'],
        });
      }

      setState(() {
        videos = fetchedVideos;
      });
    } else {
      print("Error fetching videos: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Music Videos")),
      body: videos.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loader while fetching
          : ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(videos[index]["thumbnail"]!), // Thumbnail
                  title: Text(videos[index]["title"]!), // Video Title
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VideoPlayerScreen(videoId: videos[index]["videoId"]!),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
