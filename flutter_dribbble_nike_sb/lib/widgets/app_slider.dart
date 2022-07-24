// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final double min;
  final double max;
  final int divisions;
  final double sliderValue;
  final List<double> sliderSteps;
  final Function(double value) onChangedValue;

  const AppSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.divisions,
    required this.sliderValue,
    required this.sliderSteps,
    required this.onChangedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 325,
          child: SliderTheme(
            data: const SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              activeTrackColor: Color(0xFF484848),
              inactiveTrackColor: Color(0xFF484848),
              activeTickMarkColor: Color(0xFF484848),
              inactiveTickMarkColor: Color(0xFF484848),
              valueIndicatorColor: Color(0xFF484848),
              thumbColor: Color(0xFFFF2D4C),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 8),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
            ),
            child: Slider(
              value: sliderValue <= 0 ? min : sliderValue,
              min: min,
              max: max,
              divisions: divisions,
              onChanged: (double value) => onChangedValue(value),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: sliderSteps.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 40,
                width: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedDefaultTextStyle(
                      curve: Curves.fastLinearToSlowEaseIn,
                      duration: const Duration(milliseconds: 100),
                      style: _getSliderStyle(
                        sliderSteps[index] == sliderValue,
                      ),
                      child: Text(
                        sliderSteps[index].toStringAsFixed(0),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  TextStyle _getSliderStyle(bool isSelected) {
    if (isSelected) {
      return const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
    } else {
      return const TextStyle(
        fontSize: 16,
        color: Colors.white,
      );
    }
  }
}
