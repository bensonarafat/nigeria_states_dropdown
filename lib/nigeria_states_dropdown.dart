/*
 * Created by Benson Arafat on 17 Sept 2022.
 * email: benpaul320@gmail.com
 * Edits made on original source code by Flutter.
 * Copyright 2014 The Flutter Authors. All rights reserved.
*/
library nigeria_states_dropdown;

import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nigeria_states_dropdown/models/state_model.dart';

class NigeriaStatesDropDown extends StatefulWidget {
  ///
  /// on State Change Function
  final Function(String) onStateChange;

  ///
  /// on Town Change Function
  final Function(String) onTownChange;

  ///
  /// Widget text change the hint widget of the state hint and town hint
  final Text statehint, townhint;

  ///
  /// TextStyle which affect the item style
  final TextStyle itemstyle;

  ///
  /// Right side Dropdown icon
  final Icon icon;

  ///
  /// [itemHeight] iteam height
  final double itemHeight;

  ///
  ///[iconDisabledColor] icon disabled color
  final Color iconDisabledColor;

  ///
  ///[buttonHeight] button Height
  final double buttonHeight;

  ///
  /// [buttonPadding] set the button padding
  /// [itemPadding] set the itemPadding
  /// [dropdownPadding] sett dropdown padding
  final EdgeInsetsGeometry buttonPadding, itemPadding, dropdownPadding;

  ///
  /// [buttonDecoration] set button decoration
  /// [dropdownDecoration] set drop down decoration
  final BoxDecoration buttonDecoration, dropdownDecoration;

  ///
  /// [dropdownMaxHeight] set drop down max height
  final double dropdownMaxHeight;

  ///
  /// [isExpanded] set expanded to true | false
  /// [scrollbarAlwaysShow] set scroll bar visible
  final bool scrollbarAlwaysShow, isExpanded;

  ///
  /// [scrollbarThickness] set Scroll bar thinkness
  final double scrollbarThickness;

  ///
  /// [spaceBetween] Add space between Town and State drop
  final double? spaceBetween;

  const NigeriaStatesDropDown({
    Key? key,
    this.spaceBetween = 10,
    required this.onStateChange,
    required this.onTownChange,
    this.isExpanded = true,
    this.iconDisabledColor = const Color.fromARGB(255, 65, 64, 64),
    this.itemHeight = 40,
    this.buttonHeight = 50,
    this.buttonPadding = const EdgeInsets.only(
      left: 14,
      right: 14,
    ),
    this.buttonDecoration = const BoxDecoration(
      color: Color.fromARGB(185, 175, 174, 174),
    ),
    this.dropdownDecoration = const BoxDecoration(
      color: Color.fromARGB(186, 242, 242, 242),
    ),
    this.scrollbarAlwaysShow = true,
    this.dropdownMaxHeight = 200,
    this.itemPadding = const EdgeInsets.only(left: 14, right: 14),
    this.dropdownPadding = const EdgeInsets.only(
      left: 14,
      right: 14,
    ),
    this.scrollbarThickness = 1,
    this.statehint = const Text(
      'Select State',
      style: TextStyle(
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    this.townhint = const Text(
      'Select Town',
      style: TextStyle(
        color: Colors.black,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    this.itemstyle = const TextStyle(
      color: Colors.black,
      overflow: TextOverflow.clip,
    ),
    this.icon = const Icon(
      Icons.arrow_downward,
      color: Colors.black,
    ),
  }) : super(key: key);

  @override
  State<NigeriaStatesDropDown> createState() => _NigeriaStatesDropDownState();
}

class _NigeriaStatesDropDownState extends State<NigeriaStatesDropDown> {
  StateModel? stateselected;
  StateModel? townselected;
  late List<dynamic> states;
  List<StateModel> statemodel = [];
  List<StateModel> townmodel = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    await loadStates();
    List<dynamic> stateresults = await loadStates();
    for (int i = 0; i < stateresults.length; i++) {
      setState(() {
        statemodel.add(
          StateModel(
            id: stateresults[i]["id"],
            name: stateresults[i]["name"],
            alias: stateresults[i]["alias"],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: widget.isExpanded,
            hint: widget.statehint,
            items: statemodel
                .map(
                  (item) => DropdownMenuItem<StateModel>(
                    value: item,
                    child: Text(
                      item.name,
                      style: widget.itemstyle,
                    ),
                  ),
                )
                .toList(),
            value: stateselected,
            onChanged: <StateModel>(value) => _onStateChange(value),
            iconDisabledColor: widget.iconDisabledColor,
            buttonHeight: widget.buttonHeight,
            buttonPadding: widget.buttonPadding,
            buttonDecoration: widget.buttonDecoration,
            icon: widget.icon,
            itemHeight: widget.itemHeight,
            itemPadding: widget.itemPadding,
            dropdownMaxHeight: widget.dropdownMaxHeight,
            dropdownPadding: widget.dropdownPadding,
            dropdownDecoration: widget.dropdownDecoration,
            scrollbarThickness: widget.scrollbarThickness,
            scrollbarAlwaysShow: widget.scrollbarAlwaysShow,
            offset: const Offset(-20, 0),
          ),
        ),
        SizedBox(
          height: widget.spaceBetween,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: widget.isExpanded,
            hint: widget.townhint,
            items: townmodel
                .map(
                  (item) => DropdownMenuItem<StateModel>(
                    value: item,
                    child: Text(
                      item.name,
                      style: widget.itemstyle,
                    ),
                  ),
                )
                .toList(),
            value: townselected,
            onChanged: <StateModel>(value) => _onTownChange(value),
            iconDisabledColor: widget.iconDisabledColor,
            buttonHeight: widget.buttonHeight,
            buttonPadding: widget.buttonPadding,
            buttonDecoration: widget.buttonDecoration,
            icon: widget.icon,
            itemHeight: widget.itemHeight,
            itemPadding: widget.itemPadding,
            dropdownMaxHeight: widget.dropdownMaxHeight,
            dropdownPadding: widget.dropdownPadding,
            dropdownDecoration: widget.dropdownDecoration,
            scrollbarThickness: widget.scrollbarThickness,
            scrollbarAlwaysShow: widget.scrollbarAlwaysShow,
            offset: const Offset(-20, 0),
          ),
        ),
      ],
    );
  }

  ///
  /// fetch town filter by state alias
  /// and add town to town list
  ///
  void fetchTown({
    required alias,
  }) async {
    List<dynamic> states = await loadStates();
    Map<String, dynamic> townresults =
        states.where((state) => state['alias'] == alias).toList().first;
    List<dynamic> towns = townresults['data'];
    for (int i = 0; i < towns.length; i++) {
      townmodel.add(
        StateModel(
          id: towns[i]["id"],
          name: towns[i]["name"],
        ),
      );
    }
  }

  ///
  /// Load states from json file
  ///
  Future<List<dynamic>> loadStates() async {
    String data = await rootBundle.loadString(
        'packages/nigeria_states_dropdown/assets/jsons/nigeria-state.json');
    final states = json.decode(data);

    return states;
  }

  ///
  /// When town is changed
  /// setState to value and
  ///
  _onTownChange(StateModel value) {
    setState(() {
      townselected = value;
      widget.onTownChange(value.name);
    });
  }

  ///
  /// When state is changed
  /// setState to value and
  ///
  _onStateChange(StateModel value) {
    setState(() {
      stateselected = value;
      //clear town
      townselected = null;

      /// fetch the town here
      fetchTown(alias: value.alias);

      widget.onStateChange(value.name);
    });
  }
}
