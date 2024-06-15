import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_Service.dart';
import 'package:payoneclick/Api_Services/Api_models/BrowsePlan%20Model/BrowsePlanModel.dart';




class TopUp extends StatefulWidget {
  final String userID;
  final String? selectedState;
  final String? dropdownValue2; // this holds operator name

  const TopUp({
    super.key,
    required this.userID,
    this.selectedState,
    this.dropdownValue2,
  });

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  BrowsePlanModel? browsePlan;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchBrowsePlan();
    print(widget.userID);
  }

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
            ? CircularProgressIndicator()
            : errorMessage != null
            ? Text('Error: $errorMessage')
            : ListView.builder(
          itemCount: browsePlan!.data?.records?.topup?.length ?? 0,
          itemBuilder: (context, index) {
            Plan plan = browsePlan!.data!.records!.topup![index];
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
