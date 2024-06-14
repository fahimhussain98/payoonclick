import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/screens/Testingpage2.dart';

class MobileRechargeTabBar extends StatefulWidget {
  final String title;
  const MobileRechargeTabBar({super.key, required this.title});

  @override
  State<MobileRechargeTabBar> createState() => _MobileRechargeTabBarState();
}

class _MobileRechargeTabBarState extends State<MobileRechargeTabBar>with SingleTickerProviderStateMixin {
  late TabController _controller;


  List<Widget> tabBarViews = [
    Testingpage2(),
    Text("this is second"),
    Text("this is third"),
    Text("this is fourth"),

  ];
  @override
  void initState() {

    super.initState();
    _controller = TabController(length: tabBarViews.length, vsync: this);
    _controller.addListener(() {
      print(_controller.index);
    });
  }
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
