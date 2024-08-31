import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  final TextEditingController _input_glass_num =
      TextEditingController(text: '1');

List<WaterTrack> waterTrackList =[];



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
          Text(
            '12',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              TextButton(onPressed: () {}, child: Text('Add')),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Time'),
                      subtitle: Text('Date'),
                      leading: Text('1'),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever_outlined)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 3)),
        ],
      ),
    );
  }

  void _addNewWaterTrack (){

    if(_input_glass_num.text.isEmpty){
      _input_glass_num.text ='1';
    }

    final int noOfGlasses = int.tryParse(_input_glass_num.text)?? 1;
    WaterTrack waterTrack =WaterTrack(noOfGlass: noOfGlasses, dateTime: DateTime.now());
    waterTrackList.add(waterTrack);
  }

}

class WaterTrack {
  final int noOfGlass;
  final DateTime dateTime;

  WaterTrack({required this.noOfGlass, required this.dateTime});

}