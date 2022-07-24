// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppCtaButton extends StatefulWidget {
  final String title;
  final Function(bool isTapped) onCtaTap;

  const AppCtaButton({
    Key? key,
    required this.title,
    required this.onCtaTap,
  }) : super(key: key);

  @override
  State<AppCtaButton> createState() => _AppCtaButtonState();
}

class _AppCtaButtonState extends State<AppCtaButton> {
  String get _title => widget.title;
  Function get _onCtaTap => widget.onCtaTap;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.red,
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });

        _onCtaTap(_isTapped);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: 40,
        width: 150,
        decoration: _getDecoration(),
        child: Center(
          child: Text(
            _title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getDecoration() {
    if (_isTapped) {
      return BoxDecoration(
        color: const Color(0xFFFF2D4C),
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2.5),
            color: Colors.red.shade600,
            blurRadius: 10,
          ),
        ],
      );
    } else {
      return BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: const BorderRadius.all(
          Radius.circular(32),
        ),
      );
    }
  }
}
