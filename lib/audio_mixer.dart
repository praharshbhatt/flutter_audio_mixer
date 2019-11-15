import 'package:audio_mixer/widgets/audio_mixer_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioMixer extends StatefulWidget {
  @override
  _AudioMixerState createState() => _AudioMixerState();
}

class _AudioMixerState extends State<AudioMixer> {
  double _sliderValue1 = 300,
      _sliderValue2 = 300,
      _sliderValue3 = 300,
      _sliderValue4 = 300,
      _sliderValue5 = 300,
      _sliderValue6 = 300,
      _sliderValue7 = 300,
      _sliderValue8 = 300,
      _sliderValue9 = 300,
      _sliderValue10 = 300,
      _sliderValue11 = 300;

  //For radiobutton value
  var radio1 = "SITUATIE";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          //Getting the main mixer Panel
          getMainMixerPanel(),

          //get the sidePanel
          getSidePanel()
        ],
      ),
    );
  }

  //for getting MainMixerPanel
  getMainMixerPanel() {
    return Expanded(
      flex: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Slider 1
          Expanded(
              child: GetVerticalSlider(1, _sliderValue1, (val) {
            _sliderValue1 = val;
          })),

          //Slider 2
          Expanded(
            child: GetVerticalSlider(2, _sliderValue2, (val) {
              _sliderValue2 = val;
            }),
          ),

          //Slider 3
          Expanded(
            child: GetVerticalSlider(3, _sliderValue3, (val) {
              _sliderValue3 = val;
            }),
          ),

          //Slider 4
          Expanded(
            child: GetVerticalSlider(4, _sliderValue4, (val) {
              _sliderValue4 = val;
            }),
          ),

          //Slider 5
          Expanded(
            child: GetVerticalSlider(5, _sliderValue5, (val) {
              _sliderValue5 = val;
            }),
          ),

          //Slider 6
          Expanded(
            child: GetVerticalSlider(6, _sliderValue6, (val) {
              _sliderValue6 = val;
            }),
          ),

          //Slider 7
          Expanded(
            child: GetVerticalSlider(7, _sliderValue7, (val) {
              _sliderValue7 = val;
            }),
          ),

          //Slider 8
          Expanded(
            child: GetVerticalSlider(8, _sliderValue8, (val) {
              _sliderValue8 = val;
            }),
          ),

          //Slider 9
          Expanded(
            child: GetVerticalSlider(9, _sliderValue9, (val) {
              _sliderValue9 = val;
            }),
          ),

          //Volume Slider Knob
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  child: Image.asset(
                    "assets/images/volume_slider.png",
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                  padding: EdgeInsets.only(left: 2, right: 2, top: 80)),
            ],
          ),

          //Slider 10
          Expanded(
            child: GetVerticalSlider(10, _sliderValue10, (val) {
              _sliderValue10 = val;
            }),
          ),

          //Slider 11
          Expanded(
            child: GetVerticalSlider(11, _sliderValue11, (val) {
              _sliderValue11 = val;
            }),
          ),
        ],
      ),
    );
  }

  //for getting MainMixerPanel
  getSidePanel() {
    return Expanded(
      flex: 2,
      child: Container(
          color: Colors.grey.withOpacity(0.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //image 1
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/sidepanel_1.png", width: 300, height: 150, fit: BoxFit.cover),
              ),

              //image 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/sidepanel_2.png", width: 300, height: 150, fit: BoxFit.cover),
              ),

              //Radio Buttons
              //Situatie
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "SITUATIE",
                      style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    new Radio(
                      value: "SITUATIE",
                      groupValue: radio1,
                      onChanged: (val) {
                        setState(() => radio1 = "SITUATIE");
                      },
                    ),
                  ],
                ),
              ),

              //Proces
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "PROCES",
                      style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    new Radio(
                      value: "PROCES",
                      groupValue: radio1,
                      onChanged: (val) {
                        setState(() => radio1 = "PROCES");
                      },
                    ),
                  ],
                ),
              ),

              //Cluster
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "CLUSTER",
                      style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    new Radio(
                      value: "CLUSTER",
                      groupValue: radio1,
                      onChanged: (val) {
                        setState(() => radio1 = "CLUSTER");
                      },
                    ),
                  ],
                ),
              ),

              //Team
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "TEAM",
                      style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    new Radio(
                      value: "TEAM",
                      groupValue: radio1,
                      onChanged: (val) {
                        setState(() => radio1 = "TEAM");
                      },
                    ),
                  ],
                ),
              ),

              //Organisatie
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "ORGANISATIE",
                      style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    new Radio(
                      value: "ORGANISATIE",
                      groupValue: radio1,
                      onChanged: (val) {
                        setState(() => radio1 = "ORGANISATIE");
                      },
                    ),
                  ],
                ),
              ),

              //TextFormField
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 150,
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: "Type here your Notes",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 10), gapPadding: 0),
                        fillColor: Colors.white,
                        focusColor: Colors.white),
                  )),
            ],
          )),
    );
  }
}
