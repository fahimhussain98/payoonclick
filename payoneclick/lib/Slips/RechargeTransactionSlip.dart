import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RechargeTransactionSlip extends StatefulWidget {
  const RechargeTransactionSlip({super.key});

  @override
  State<RechargeTransactionSlip> createState() => _RechargeTransactionSlipState();
}

class _RechargeTransactionSlipState extends State<RechargeTransactionSlip> {
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

            ),
            body:Column(
              children: [
                Container(
                  height: 500,
                  width: 450,
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("TRANSACTION SLIP",style: TextStyle(color: Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        height: 50,
                          width: 150,
                          color: Colors.white,
                          child: Image.asset("image/loginicon.png",)),
                      Container(
                        height: 20,
                        color: Colors.white,
                        child: Text("Transactions Details",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 16),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Divider(color: Colors.blueAccent,thickness: 4,),
                      ),
                      Container(
                        height: 2,
                        margin: EdgeInsets.only(left: 30,right: 30),
                        color: Colors.brown,
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("TxId",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("983482349873924",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Live ID",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("BR00AN234HHM",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Number",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("9510085821",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Opening Balance",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("\u{20B9}50.0",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Amount",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("\u{20B9}10.0",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Closing Bal",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("\u{20B9}10.0",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Operator",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("Reliance Jio",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Status",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("SUCCESS",style: TextStyle(fontSize: 12,color: Color.fromRGBO( 2,172,10,1),fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Date",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("26 March 2024",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        height: 25, width: double.infinity,
                        margin: EdgeInsets.only(left: 15,right: 15),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text("Time",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,),),
                            Spacer(),
                            Text("12:32am",style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: double.maxFinite,
                        color: Colors.transparent,
                        child:Text("--------------------------------------------------------------------------------------",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                      ),
                      //_____________congractulation__________
                      Container(
                        height: 56,
                         margin: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Text("Congratulations",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromRGBO( 2,172,10,1)),),
                            Text("Your Transaction hass Successful",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromRGBO( 2,172,10,1)))
                          ],
                        ),
                      ),

                    ],
                  ),


                ),
                //________out of the Big Box___________
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 20,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Center(child: Text("Shop Details ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                ),
                Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.transparent,

                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Text("Anas Malik"),
                          SizedBox(width: 5,),
                          Text("(Retailer)")
                        ],
                      )
                ),
                Container(
                    height: 20,
                    width: double.infinity,
                    color: Colors.transparent,

                    child:Center(child: Text("954022334"))

                ),
                Container(
                    height: 70,
                    width: double.infinity,



                    color: Colors.transparent,
                  child: Row(
                    children: [
                       Container(
                         height:40,
                         width: 160,
                         margin: EdgeInsets.only(left: 15),
                         child: ElevatedButton(
                          onPressed: () {
                        //    Navigator.pop(context);
                          },
                          child: Text('Raise Complain',style: TextStyle(fontSize: 14),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,

                          ),
                                               ),
                       ),
                     Spacer(),

                      Container(
                        height:40,
                        width: 160,
                        margin: EdgeInsets.only(right: 15),

                        child: ElevatedButton(
                          onPressed: () {
                          //  Navigator.pop(context);
                          },
                          child: Text('Share',style: TextStyle(fontSize: 14),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,

                          ),
                        ),
                      ),

                    ],
                  ),



                ),



              ],

            ),

          ),
        ],
      ),
    );

  }
}
