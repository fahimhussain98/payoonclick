import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:html/parser.dart' show parse;
import 'package:payoneclick/Api_Services/Api_models/BrowsePlan%20Model/BrowsePlanModel.dart';
import 'package:payoneclick/Drawer/MyCustomDrawer.dart';
import 'package:payoneclick/Slips/RechargeTransactionSlip.dart';
import 'package:share/share.dart';

class Testingpage2 extends StatefulWidget {
  const Testingpage2({super.key});

  @override
  State<Testingpage2> createState() => _Testingpage2State();
}

class _Testingpage2State extends State<Testingpage2> {
  BrowsePlanModel? browsePlan;

  @override
  void initState() {
    super.initState();
    fetchBrowsePlan();
  }

  Future<void> fetchBrowsePlan() async {
    ApiServices apiServices = ApiServices();
    BrowsePlanModel? fetchedPlan = await apiServices.getBrowsePlan("AhCtz8JqpO6PfQGhRvyTNlunsKFHQMXB", "VI", "Delhi");
    setState(() {
      browsePlan = fetchedPlan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: browsePlan == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: browsePlan!.data.records.topup.length,
        itemBuilder: (context, index) {
          Plan plan = browsePlan!.data.records.topup[index];
          return ListTile(
            title: Text(plan.desc),
            subtitle: Text('Rs: ${plan.rs}, Validity: ${plan.validity}'),
          );
        },
      ),
    );
  }
}