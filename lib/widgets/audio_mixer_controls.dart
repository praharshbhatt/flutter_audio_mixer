import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

typedef CallBackDouble(double val);

//Returns Vertical draggable Slider
class GetVerticalSlider extends StatefulWidget {
  int sliderNumber;
  double _sliderValue;
  CallBackDouble onDragging;

  GetVerticalSlider(this.sliderNumber, this._sliderValue, this.onDragging);

  @override
  _GetVerticalSliderState createState() => _GetVerticalSliderState(sliderNumber, _sliderValue, onDragging);
}

class _GetVerticalSliderState extends State<GetVerticalSlider> {
  int sliderNumber;
  double _sliderValue;
  CallBackDouble onDragging;

  //For all the buttons and switches
  String strEnabledLED = "grey";
  int intEnabledPinHole = 0;
  bool isSwitchOn = false;

  //Constructor
  _GetVerticalSliderState(this.sliderNumber, this._sliderValue, this.onDragging);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //get the LED Lights
        getLEDs(),

        //get the Pin Holes
        getPinHoles(),

        //get the Mixer Slider
        getFlutterSlider(),

        //get the Switches
        getSwitches()
      ],
    );
  }

  //LED Lights
  getLEDs() {
    return Container(
      width: 30,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Red Button
          Container(
            width: 40,
            height: 20,
            child: RaisedButton(
              color: strEnabledLED == "red" ? Colors.redAccent : Colors.red,
              onPressed: () {
                setState(() => strEnabledLED = "red");
              },
            ),
          ),

          //Yellow Button
          Container(
            width: 40,
            height: 20,
            child: RaisedButton(
              color: strEnabledLED == "yellow" ? Colors.yellowAccent : Colors.yellow,
              onPressed: () {
                setState(() => strEnabledLED = "yellow");
              },
            ),
          ),

          //Green Button
          Container(
            width: 40,
            height: 20,
            child: RaisedButton(
              color: strEnabledLED == "green" ? Colors.greenAccent : Colors.green,
              onPressed: () {
                setState(() => strEnabledLED = "green");
              },
            ),
          ),

          //Grey Button
          Container(
            width: 40,
            height: 20,
            child: RaisedButton(
              color: strEnabledLED == "grey" ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() => strEnabledLED = "grey");
              },
            ),
          ),
        ],
      ),
    );
  }

  //LED Lights
  getPinHoles() {
    return Container(
      width: 30,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Pin hole button 1
          Container(
            width: 30,
            height: 30,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(90)),
              color: intEnabledPinHole == 0 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() => intEnabledPinHole = 0);
              },
            ),
          ),

          //Pin hole button 2
          Container(
            width: 30,
            height: 30,
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(90)),
              color: intEnabledPinHole == 1 ? Colors.blueGrey : Colors.grey,
              onPressed: () {
                setState(() => intEnabledPinHole = 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  //Mixer Slider
  getFlutterSlider() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: FlutterSlider(
        axis: Axis.vertical,
        values: [_sliderValue],
        max: 100,
        min: 0,
        rangeSlider: false,
        rtl: true,

        //Handlers
        handler: FlutterSliderHandler(
            decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.rectangle,
                border: Border.all(width: 5.0, color: Colors.white30),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Icon(
              Icons.drag_handle,
              color: Colors.white,
            )),

        //trackBar
        trackBar: FlutterSliderTrackBar(
          activeTrackBarHeight: 10,
          inactiveTrackBarHeight: 10,
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black12,
            border: Border.all(width: 30, color: Colors.black),
          ),
          activeTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: (_sliderValue / 1) <= 40
                  ? Colors.black.withOpacity(0.5)
                  : ((_sliderValue / 1) > 40 && (_sliderValue / 1) <= 60)
                      ? Colors.green.withOpacity(0.5)
                      : ((_sliderValue / 1) > 60 && (_sliderValue / 1) <= 80)
                          ? Colors.yellow.withOpacity(0.5)
                          : Colors.red.withOpacity(0.5)),
        ),

        //tooltip
        tooltip: FlutterSliderTooltip(
            textStyle: TextStyle(fontSize: 17, color: Colors.white),
            boxStyle: FlutterSliderTooltipBox(decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)))),

        //hatchMark
        hatchMark: FlutterSliderHatchMark(
            density: 0.5, // means 50 lines, from 0 to 100 percent
            labels: List.generate(11, (index) {
              if (index == 0) {
                return FlutterSliderHatchMarkLabel(percent: 0, label: Text("Closed"));
              } else if (index == 10) {
                return FlutterSliderHatchMarkLabel(percent: 100, label: Text("Max"));
              } else {
                return FlutterSliderHatchMarkLabel(percent: index * 10.0, label: Text((index * 10).toString() + ' %'));
              }
            })),

        //onDragging
        onDragging: (handlerIndex, lowerValue, upperValue) {
          setState(() {
            _sliderValue = lowerValue;
          });
//          print("Slider value: " + _sliderValue.toString() + ", " + (_sliderValue / 1).toString() + "%");
          onDragging(lowerValue);
        },

        onDragCompleted: (handlerIndex, lowerValue, upperValue) {
          setState(() {
            _sliderValue = lowerValue;
          });
//          print("Slider value: " + _sliderValue.toString() + ", " + (_sliderValue / 1).toString() + "%");
          onDragging(lowerValue);
        },
      ),
    );
  }

  //Switches
  getSwitches() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(sliderNumber.toString()),
          Container(
            width: 70,
            height: 50,
            child: InkWell(
                child: isSwitchOn ? Image.asset("assets/images/on.png") : Image.asset("assets/images/off.png"),
                onTap: () {
                  setState(() => isSwitchOn = !isSwitchOn);
                }),
          )
        ],
      ),
    );
  }
}
