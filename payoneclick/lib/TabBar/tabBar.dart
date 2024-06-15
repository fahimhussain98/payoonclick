import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/TabBar/threeG.dart';
import 'package:payoneclick/TabBar/ComboOffer.dart';
import 'package:payoneclick/TabBar/Roaming.dart';
import 'package:payoneclick/TabBar/TopUp.dart';


class MobileRechargeTabBar extends StatefulWidget {
  final String title;
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; //this is hold the value of the circle

  const MobileRechargeTabBar({
    super.key,
    required this.title,
    required this.userID,
    this.selectedState,
    this.dropdownValue2,

  });

  @override
  State<MobileRechargeTabBar> createState() => _MobileRechargeTabBarState();
}

class _MobileRechargeTabBarState extends State<MobileRechargeTabBar>with SingleTickerProviderStateMixin {
  late TabController _controller;
  late List<Widget> tabBarViews; // Declare as late initialization variable

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    tabBarViews = [
      TopUp(
        userID: widget.userID,
        selectedState: widget.selectedState,
        dropdownValue2: widget.dropdownValue2,
      ),
      threeG(
        userID: widget.userID,
        selectedState: widget.selectedState,
        dropdownValue2: widget.dropdownValue2,
      ),
      Roaming(
        userID: widget.userID,
        selectedState: widget.selectedState,
        dropdownValue2: widget.dropdownValue2,
      ),
      ComboOffer(
        userID: widget.userID,
        selectedState: widget.selectedState,
        dropdownValue2: widget.dropdownValue2,
      ),
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  // List<Widget> tabBarViews = [
  //   TopUp(
  //     userID: widget.userID,
  //     selectedState: widget.selectedState,
  //     dropdownValue2: widget.dropdownValue2,
  //   ),
  //   threeG(),
  //   Roaming(),
  //   ComboOffer(),
  //
  // ];
  // @override
  // void initState() {
  //
  //   super.initState();
  //   _controller = TabController(length: tabBarViews.length, vsync: this);
  //   _controller.addListener(() {
  //     print(_controller.index);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade800,
            bottom: TabBar(
              tabs: [
               Text("TOP UP",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
                Text("3G/4G",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
                Text("ROAMING",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
                Text("COMBO OFFER",style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),),
              ],
              onTap: (index){
                print(index);
              },
              controller: _controller,
            ),
            title: Text(widget.title,style: TextStyle(color: Colors.white),),
          ),
          body: Center(
            child: TabBarView(
              controller: _controller,
              children:
                tabBarViews,

            ),
          ),
        ),

    );
  }
}
