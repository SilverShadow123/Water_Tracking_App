import 'package:flutter/material.dart';
import 'package:water_traking_app/water_track.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController _input_glass_num =
      TextEditingController(text: '1');

  List<WaterTrack> waterTrackList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          waterheader(),
          Expanded(
              child: viewList()),
        ],
      ),
    );
  }

  Widget viewList() {
    return ListView.separated(
      itemCount: waterTrackList.length,
                itemBuilder: (context, index) {
                  return _waterTrackListTile(index);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
               );
  }

  ListTile _waterTrackListTile(int index) {
    WaterTrack waterTrack = waterTrackList[index];
    return ListTile(
                  title: Text('${waterTrack.dateTime.hour} : ${waterTrack.dateTime.minute}'),
                  subtitle: Text('${waterTrack.dateTime.day}-${waterTrack.dateTime.month}-${waterTrack.dateTime.year}'),
                  leading: CircleAvatar(child: Text('${waterTrack.noOfGlass}')),
                  trailing: IconButton(
                      onPressed: ()=>_deteleSingleBar(index),
                      icon: const Icon(Icons.delete_forever_outlined)),
                );
  }

  Widget waterheader() {
    return Column(
          children: [
            Text(
              totalGlass().toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Glass/s',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: _input_glass_num,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(onPressed: _addNewWaterTrack, child: const Text('Add')),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        );
  }

  int totalGlass() {
    int counter = 0;
    for (WaterTrack t in waterTrackList) {
      counter += t.noOfGlass;
    }
    return counter;
  }

  void _addNewWaterTrack() {
    if (_input_glass_num.text.isEmpty) {
      _input_glass_num.text = '1';
    }

    final int noOfGlasses = int.tryParse(_input_glass_num.text) ?? 1;
    WaterTrack waterTrack =
        WaterTrack(noOfGlass: noOfGlasses, dateTime: DateTime.now());
    waterTrackList.add(waterTrack);
    setState(() {});
  }
  void _deteleSingleBar(int index){
    waterTrackList.removeAt(index);
    setState(() {

    });
    
  }
}


