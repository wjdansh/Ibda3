import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

import 'api/apiCancelLoan.dart';
import 'api/getCustomerLoansApi.dart';
//import 'package:stacked_card_carousel/stacked_card_carousel.dart';
//

var height;
var width;

int loanProcess_id;

String stateLoan;

TextEditingController cancelationReasonController = TextEditingController();

class MyLoans extends StatefulWidget {
  const MyLoans({Key key}) : super(key: key);

  @override
  _MyLoansState createState() => _MyLoansState();
}

class _MyLoansState extends State<MyLoans> {
  final gCLController _gclControlle = Get.put(gCLController());

  @override
  void initState() {
    // getCustomerLoans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(width: 55),
                      Image.asset(
                        Global.lan == 'Arabic'
                            ? 'assets/images/logoAr.png'
                            : 'assets/images/logoEn.png',
                        width: 180,
                        height: 90,
                      ),
                      //  SizedBox(width: 25),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/Dloan.png',
                          width: 50,
                          height: 30,
                        ),
                        Text("My Loans".tr,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Divider(
                      color: Theme.of(context).secondaryHeaderColor,
                      thickness: 2,
                    ),
                  ),
                  Container(
                      height: 580,
                      width: 100,
                      child: FutureBuilder(
                          future: _gclControlle.getCustomerLoans(),
                          builder: (context, snapShot) {
                            if (!snapShot.hasData) {
                              return Container(
                                padding: EdgeInsets.only(top: 90),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      ' " No Loans for The current user "  '.tr,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                              );
                            } else
                              return ListView.builder(
                                itemCount:
                                    snapShot.data.length, //resultList.length,
                                itemBuilder: (context, i) {
                                  print(
                                    snapShot.data.length,
                                  );

                                  //loanProcess_id = resultList[i].loanProcessId;

                                  stateLoan = _gclControlle.resultList[i].state;
                                  return cardLoanm(
                                      _gclControlle.resultList[i].loanProcessId,
                                      _gclControlle
                                          .resultList[i].requestedAmount,
                                      _gclControlle.resultList[i].state,
                                      _gclControlle.resultList[i].loanService,
                                      _gclControlle.resultList[i].requestDate);
                                },
                              );
                          })),
                ],
              ),
            ),
          ),
        ),
      ),

      // ),
    );
  }

  cardLoanm(int loanProcessId, double requestAmount, String state, String type,
      String date) {
    return Container(
      width: Get.width / 3,
      height: Get.height / 4,
      child: Card(
        // borderOnForeground: true,
        // color: Colors.white.withOpacity(0.9),
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //   elevation: 1,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.all(8),
              width: Get.width,
              height: Get.height / 6,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: Get.width / 6,
                          height: Get.height / 9,
                          child: Tab(
                            icon: type == 'قرض فردي'
                                ? Image.asset('assets/images/icons/il3.png')
                                : Image.asset(
                                    'assets/images/icons/groupl10.png'),
                          ),
                        ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        Text(type.tr, //"fill  the personal information",
                            style: TextStyle(
                              fontSize: 16,
                              // color: Theme.of(context).primaryColor
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: VerticalDivider(
                      color: Theme.of(context).accentColor,
                      thickness: 2,
                    ),
                  ),

                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          richTextB('Amount: ', requestAmount.toString()),
                          richTextB('State:', state.tr),
                          richTextB('Date:', date.substring(0, 10))
                        ],
                      ),
                    ),
                  ),
                  // stateLoan == 'Pending Loan Officer Check'
                  //     ? InkWell(
                  //         splashColor: Colors.white,
                  //         borderRadius: BorderRadius.circular(10.0),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             color: Color(0xff92CA64),
                  //             borderRadius: BorderRadius.circular(20.0),
                  //           ),
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: Icon(
                  //               Icons.close_rounded,
                  //               color: Colors.white,
                  //               size: width / 18,
                  //             ),
                  //           ),
                  //         ),
                  //         onTap: () {
                  //           setState(() {
                  //             loanProcess_id = loanProcessId;
                  //           });
                  //           cancelationReasonController.clear();
                  //           buildShowDialog(context);
                  //         },
                  //       )
                  //     : Text(''),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            stateLoan == 'Pending Loan Officer Check'
                ? InkWell(
                    // splashColor: Colors.white,
                    // minWidth: 10,
                    // borderRadius: BorderRadius.circular(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff92CA64),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: width / 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Cancel request'.tr,
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        loanProcess_id = loanProcessId;
                      });
                      cancelationReasonController.clear();
                      buildShowDialog(context);
                    },
                  )
                : Text(''),
          ],
        ),
        // ),
      ),
    );
  }

  richTextB(String label, String dis) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: RichText(
        text: new TextSpan(
          children: [
            new TextSpan(
                text: label,
                style: new TextStyle(
                  // color: Colors.black38,
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 16,
                  letterSpacing: 2,
                )),
            TextSpan(
              text: dis,
              style: new TextStyle(
                //color: Theme.of(context).primaryColor,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: Color(0xffe7f9fc),
        title: Text(
          "Cancellation Reason",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
              child: Text("Submit", style: TextStyle(color: Colors.black)),
              onPressed: () async {
                await apiCancelLoan();
                await _gclControlle.getCustomerLoans();
              }),
          TextButton(
            child: Text("Back", style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        content: TextFormField(
          controller: cancelationReasonController,
          style: TextStyle(color: Color(0xff0E2947)),
          decoration: InputDecoration(
              fillColor: Colors.grey,
              // counter: Offstage(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Loan Cancel Reason",
              labelStyle: TextStyle(color: Colors.black, fontSize: 14),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff0E2947)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).secondaryHeaderColor),
              ),
              border: UnderlineInputBorder()),
          keyboardType: TextInputType.multiline,
          // validator: (value) => (value.trim().isEmpty)
          //     ? 'field is required'.tr
          //     : null,
        ),
      ),
    );
  }
}
