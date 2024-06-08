import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payoneclick/Api_Services/Api_models/RechargeModel/RechargeReportModel.dart';
import 'package:table_calendar/table_calendar.dart';

class RechargeReportScreen extends StatefulWidget {
  const RechargeReportScreen({Key? key}) : super(key: key);

  @override
  _RechargeReportScreenState createState() => _RechargeReportScreenState();
}

class _RechargeReportScreenState extends State<RechargeReportScreen> {

  //______________________calendar functoin_________________________

  DateTime _focusedDay = DateTime.now();
  DateTime? _fromDate;
  DateTime? _toDate;
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime? tempPickedDate;
    final DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        print("from Date yan hai ${_fromDate}");

        print("T000 Date yan hai ${_toDate}");
        return Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Material(
                      child: Theme(
                        data: ThemeData(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.deepPurple, // Header background color __fix__
                            background: Colors.white,

                            onPrimary: Colors.grey, // Header text color
                            onSurface: Colors.black, // Calendar text color ____fix__
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              // Button text color
                            ),
                          ),
                        ),
                        child: CalendarDatePicker(
                          initialDate: _focusedDay,
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030),
                          onDateChanged: (DateTime date) {
                            tempPickedDate = date;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = pickedDate;
        } else {
          _toDate = pickedDate;
        }
        _focusedDay = pickedDate;
      });
    }
  }
  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.year}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}';
  }
  //______________________getRechargeReport_________________________
  RechargeReportsModel rechargeReportsModel = RechargeReportsModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "image/ProfileWI.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent, // Ensure the scaffold background is transparent
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0, // Remove shadow
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Stack(
                      children: [
                        Image.asset('image/circleForDrawer.png'),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, top: 5),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 25,
                          ), // Change to back arrow icon
                        ),
                      ],
                    ),
                    onPressed: () {
                   //   Navigator.pop(context); // Navigate back to the previous screen
                    },
                  );
                },
              ),
              title: Center(
                child: Text(
                  "RECHARGE REPORT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body:Column(
              children: [
                //here is the two Row for the Calendar
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: Container(
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // Changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            // Here is the From Date
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("From Date", style: TextStyle(color: Colors.grey, fontSize: 13)),
                                Text(
                                  _formatDate(_fromDate) == '' ? "01-10-2023" : _formatDate(_fromDate),
                                  style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: Container(
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // Changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            // Here is the To Date
                            SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("To Date", style: TextStyle(color: Colors.grey, fontSize: 13)),
                                Text(
                                  _formatDate(_toDate) == '' ? "06-06-2024" : _formatDate(_toDate),
                                  style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: 40,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                        //  Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.filter_alt_outlined),
                            Text('FILTER',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.indigoAccent,

                        ),
                      ),
                    ),
                    Spacer(),

                    Container(
                      margin: EdgeInsets.only(right: 5),
                      height: 40,
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                          //  Navigator.pop(context);
                        },
                        child: Text('SUBMIT',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.indigoAccent,

                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),

                //this is Big container

                Container(  //this is main
                  margin: EdgeInsets.only(left: 5,right: 5),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1), // Changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                      children:
                      [
                        Container( //1 green
                          height: 190,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO( 2,172,10,1),
                            borderRadius: BorderRadius.circular(9),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40,right: 10),
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Text("\u{20B9}1000", style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),)),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 15,left: 5),
                                  height: 25,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Text("Opening Bal. ",style: TextStyle(color: Colors.white),),
                                      Spacer(),
                                      Text("\u{20B9} 50.0 ",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 5),
                                  height: 25,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Text("Closing Bal. ",style: TextStyle(color: Colors.white),),
                                      Spacer(),
                                      Text("\u{20B9} 401.0 ",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 5),
                                  height: 25,
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Text("Cash Back ",style: TextStyle(color: Colors.white),),
                                      Spacer(),
                                      Text("\u{20B9} 0.1 ",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(left: 5),
                                  height: 25,
                                  color: Colors.transparent,
                                  child: Icon(Icons.share,size: 25,color: Colors.white,),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container( //2 topleft
                          height: 85,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9),
                              bottomRight: Radius.circular(20),
                            ),

                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 10),
                                child: Image.asset("image/jioIcon.png",height: 20,width: 20,),
                              ),
                              SizedBox(width: 15,),
                              Padding(
                                padding: EdgeInsets.only(top: 35),
                                child: Text("8283937294  \n Reliance Jio",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                              ),


                            ],
                          ),
                        ),
                        Align( //3 topRight
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 400,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(9),
                              ),

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text("Txnld : 09849724524",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold), ),
                                    ),
                                    Spacer(),
                                    Text("26 March 2024 \n        12:32 am",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                // Text("12:32 am ")
                              ],
                            ),

                          ),
                        ),

                      ]
                  ),
                )


              ],
            ),

          ),
        ],
      ),
    );

  }

}
