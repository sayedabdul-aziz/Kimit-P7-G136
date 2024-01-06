import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

class TadbourView extends StatefulWidget {
  const TadbourView({super.key});

  @override
  State<TadbourView> createState() => _TadbourViewState();
}

class _TadbourViewState extends State<TadbourView> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://upload.mp3quran.net/tadabbor/21%D9%88%D8%A3%D9%85%D8%B1_%D8%A3%D9%87%D9%84%D9%83_%D8%A8%D8%A7%D9%84%D8%B5%D9%84%D8%A7%D8%A9_-_%D9%85%D9%86%D8%B5%D9%88%D8%B1_%D8%A7%D9%84%D8%B3%D8%A7%D9%84%D9%85%D9%8A.mp4',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play().then((value) {
      setState(() {});
    });
    // Use the controller to loop the video.
    // _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  bool downloading = false;
  var progressString = "";
  Future<void> downloadFile() async {
    FileDownloader.downloadFile(
      url:
          'https://upload.mp3quran.net/tadabbor/21%D9%88%D8%A3%D9%85%D8%B1_%D8%A3%D9%87%D9%84%D9%83_%D8%A8%D8%A7%D9%84%D8%B5%D9%84%D8%A7%D8%A9_-_%D9%85%D9%86%D8%B5%D9%88%D8%B1_%D8%A7%D9%84%D8%B3%D8%A7%D9%84%D9%85%D9%8A.mp4',
      name: DateTime.now().toIso8601String(),
      onProgress: (fileName, progress) {
        setState(() {
          downloading = true;
          progressString = progress.toInt().toString();
          print(progressString);
        });
      },
      onDownloadCompleted: (path) {
        print('done');
        setState(() {
          downloading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('تم التنزيل')));
      },
      onDownloadError: (errorMessage) {
        setState(() {
          downloading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'tap 1',
              onPressed: () {
                downloadFile();
              },
              child: const Icon(Icons.download),
            ),
            const Gap(10),
            FloatingActionButton(
              heroTag: 'tap 2',
              onPressed: () {
                // Wrap the play or pause in a call to `setState`. This ensures the
                // correct icon is shown.
                setState(() {
                  // If the video is playing, pause it.
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    // If the video is paused, play it.
                    _controller.play();
                  }
                });
              },
              // Display the correct icon depending on the state of the player.
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
