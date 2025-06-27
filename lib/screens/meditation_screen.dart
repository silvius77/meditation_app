import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/models.dart';
import 'package:just_audio/just_audio.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  final List<Item> items = [
    Item(
      name: "Forest",
      imagePath: "src/img/forest.jpeg",
      audioPath: "src/audio/forest.mp3",
    ),
    Item(
      name: "Night",
      imagePath: "src/img/night.jpeg",
      audioPath: "src/audio/night.mp3",
    ),
    Item(
      name: "Ocean",
      imagePath: "src/img/ocean.jpeg",
      audioPath: "src/audio/ocean.mp3",
    ),
    Item(
      name: "Waterfall",
      imagePath: "src/img/waterfall.jpeg",
      audioPath: "src/audio/waterfall.mp3",
    ),
    Item(
      name: "Wind",
      imagePath: "src/img/wind.jpeg",
      audioPath: "src/audio/wind.mp3",
    ),
    Item(
      name: "Lolita",
      imagePath: "src/img/lolita.jpg",
      audioPath: "src/audio/lolita.mp3",
    ),
    Item(
      name: "David Guetta Feat. Sia - She Wolf Falling To Pieces",
      imagePath: "src/img/David-Guetta.jpg",
      audioPath: "src/audio/David Guetta Feat. Sia - She Wolf Falling To Pieces (Extended).mp3",
    ),
    Item(
      name: "No named track",
      imagePath: "src/img/cup.jfif",
      audioPath: "src/audio/For_Olya=).mp3",
    )
  ];

  final AudioPlayer player = AudioPlayer();

  int? playingIndex;

  Widget showIcon(int currentIndex){
    if (playingIndex == currentIndex){
      return Icon(Icons.stop);
    }
    else{
      return Icon(Icons.play_arrow);
    }
  }


  @override
  void initState() {
    super.initState();

    for (int i = 1; i <= 16; i++) {
      items.add(
        Item(
              name: "ForFun - Spring in My Heart $i",
              imagePath: "src/img/for_fun.jpg",
              audioPath: "src/audio/ForFun_$i.mp3",
            )
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(items[index].imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Text(items[index].name),
                  leading: IconButton(
                    // icon: Icon(Icons.play_arrow),
                    icon: showIcon(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.5), // Полупрозрачный белый
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {

                      if (playingIndex == index){
                        setState(() {
                          playingIndex = null;
                        });

                        player.stop();

                      }
                      else{
                        player.setAsset(items[index].audioPath);
                        player.play();


                        setState(() {
                          playingIndex = index;
                        });
                      }

                      
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
