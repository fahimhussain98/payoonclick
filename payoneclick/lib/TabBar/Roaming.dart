import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/BrowsePlan%20Model/BrowsePlanModel.dart';

class Roaming extends StatefulWidget {
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; // this holds operator name
  const Roaming({
    super.key,
    required this.userID,
    this.selectedState,
    this.dropdownValue2
  });

  @override
  State<Roaming> createState() => _RoamingState();
}

class _RoamingState extends State<Roaming> {
  BrowsePlanModel? browsePlan;
  String? errorMessage;



  @override
  void initState() {
    super.initState();
    fetchBrowsePlan();
  }
  // List<String>rsList = [];
  // List<String>descList =[];
  // List<String>validityList =[];
  // List<String>lastUpdateList =[];
  // Future<void> fetchBrowsePlan() async {
  //   ApiServices apiServices = ApiServices();
  //   BrowsePlanModel? fetchedPlan = await apiServices.getBrowsePlan("AhCtz8JqpO6LjhrAYpZCiFunsKFHQMXB", "VI", "Delhi");
  //   if(fetchedPlan != null){
  //     setState(() {
  //       browsePlan = fetchedPlan;
  //
  //       for (var plan4 in fetchedPlan.data.records.romaing) {
  //         rsList.add(plan4.rs);
  //         descList.add(plan4.desc);
  //         validityList.add(plan4.validity);
  //         lastUpdateList.add(plan4.lastUpdate);
  //       }
  //     });
  //   }
  // }
  Future<void> fetchBrowsePlan() async {
    ApiServices apiServices = ApiServices();
    try {
      BrowsePlanModel? fetchedPlan = await apiServices.getBrowsePlan(
        widget.userID,
        widget.dropdownValue2 ?? "VI",
        widget.selectedState ?? "Delhi",
      );

      if (fetchedPlan != null) {
        setState(() {
          browsePlan = fetchedPlan;

          // Check if there's an error message
          if (fetchedPlan.data?.records?.msg != null) {
            // Handle the error message accordingly
            errorMessage = fetchedPlan.data?.records?.msg;
            print('Error: $errorMessage');
          } else {
            // Normal processing
            errorMessage = null;
          }
        });
      }
    } catch (e) {
      print('Error fetching browse plan: $e');
      setState(() {
        errorMessage = 'Failed to fetch data';
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: browsePlan == null
            ? Container(child: Center(child: Text("Loading data...",style: TextStyle(fontSize: 14,),)),)
            : errorMessage != null
            ? Text('Error: $errorMessage')
            : ListView.builder(
          itemCount: browsePlan!.data?.records?.romaing?.length ?? 0,
          itemBuilder: (context, index) {
            Plan plan = browsePlan!.data!.records!.romaing![index];
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 3,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Validity",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${plan.validity}",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          child: Text("   \u{20B9} ${plan.rs}  "),
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${plan.desc}",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 2),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//
// ListTile(
// title: Text(plan.desc),
// subtitle: Text('Rs: ${plan.rs}, Validity: ${plan.validity}'),
// );