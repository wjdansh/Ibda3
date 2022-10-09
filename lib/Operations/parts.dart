import 'dart:ui';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ibda3/Complaint/ComplaintController.dart';
import 'package:ibda3/DigitalAccount/DigitalAccount.dart';
import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:ibda3/MainPage/MainPage.dart';
import 'package:ibda3/Message/MessageController.dart';
import 'package:ibda3/NAccount/NAccount.dart';
import 'package:ibda3/api_MyLoans/api/getCustomerLoansApi.dart';
import 'package:provider/provider.dart';
import '../PurchaseLoan/PurchaseLoan.dart';
import '../global/globalVars.dart' as Global;
import '../provideri.dart';

final loanrequestController _loanrequestController =
    Get.put(loanrequestController());
//final MessageController _messageController = Get.put(MessageController());

String val;

bool loanval = true;
final _formKey = GlobalKey<FormState>();

TextEditingController messageTextController = TextEditingController();
List<Widget> indexedPage = [
  Loan(),
  NAccount(),
  digitalAccount(),
  purchaseLoan(),
//  subProducts(),
  // complaint(),
  // message(),
];

class Loan extends StatefulWidget {
  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  @override
  void initState() {
    loanval = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListStatment(String title, String icon, Function function,
        {IconData check}) {
      return InkWell(
          child: Row(
            children: [
              Tab(icon: Image.asset('assets/images/icons/${icon}.png')),
              Text("  |  ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0EBDC8),
                  )),
              Text(title.tr, //"fill  the personal information",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(
                width: 5,
              ),
              Check(title),
            ],
          ),
          onTap: function);
    }

    L_Loan(String title, String icon) {
      return Container(
        width: Get.width / 2.1,
        height: Get.height / 2.3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: Colors.transparent, //white.withOpacity(0.5),
          //  elevation: 1,
          child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 150,
                      width: 70,
                      child: Tab(
                          icon:
                              Image.asset('assets/images/icons/${icon}.png'))),
                  SizedBox(
                    width: 15,
                  ),
                  Text(title.tr, //"fill  the personal information",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, //Theme.of(context).primaryColor
                      )),
                ],
              ),
              onTap: () {
                title == 'Individual Loan'
                    ? {
                        Get.toNamed('/LoanStatements'),
                        Global.GIGLoan = 'Individual Loan',
                        print('99 ${Global.GIGLoan}')
                      }
                    : {
                        Get.toNamed('/GroupLoan'),
                        Global.GIGLoan = 'Group Loan',
                        print('99 ${Global.GIGLoan}')
                      };

                title == 'Individual Loan'
                    ? _loanrequestController.Loanv = 1
                    : _loanrequestController.Loanv = 2;
              }),

          //   ],
          // ),
        ),
      );
    }

    return loanval
        ? ListView(
            children: [
              ListStatment('fill the personal information', 'Pi', () {
                Get.toNamed('/loanrequest'); //.then((value) => setState(() {}))
              }),
              SizedBox(height: 20),
              ListStatment('fill the financial data', 'Pi', () {
                Global.checkP_info == true
                    ? Get.toNamed('/financialStatements')
                    : Get.snackbar('Note'.tr,
                        'Please fill the personal information first'.tr,
                        duration: Duration(seconds: 6),
                        backgroundColor: Color(0xc3cff6fa),
                        icon: Icon(
                          Icons.warning,
                          color: Colors.yellow,
                        ));
              }),
              SizedBox(height: 20),
              ListStatment('fill the Loan data', 'Dloan', () {
                (Global.checkP_info == true && Global.checkF_info == true)
                    ? setState(() {
                        loanval = !loanval;
                      })
                    : Get.snackbar(
                        'Note'.tr,
                        'Please fill the personal information and the financial data first'
                            .tr,
                        duration: Duration(seconds: 6),
                        backgroundColor: Color(0xc3cff6fa),
                        icon: Icon(
                          Icons.warning,
                          color: Colors.yellow,
                        ));
              }),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Color(0xff0EBDC8),
                  splashColor: Colors.white,
                  height: 50,
                  minWidth: Get.width / 2,
                  child: Text(
                    'Loan request'.tr,
                    //login == true ? 'Login'.tr : 'Register'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    (Global.checkP_info == true &&
                            Global.checkF_info == true &&
                            Global.checkL_info == true)
                        ? _loanrequestController.apiloanreqstat(context)
                        : Get.snackbar('Note'.tr,
                            'Please fill all information required first'.tr,
                            duration: Duration(seconds: 6),
                            backgroundColor: Color(0xc3cff6fa),
                            icon: Icon(
                              Icons.warning,
                              color: Colors.yellow,
                            ));

                    //Get.offNamed('/loanrequest');
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Color(0xff0EBDC8),
                      )),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    // color: Color(0xff0EBDC8),
                    splashColor: Colors.white,
                    height: 50,
                    minWidth: Get.width / 2,
                    child: Text(
                      'My Loans'.tr,
                      //login == true ? 'Login'.tr : 'Register'.tr,
                      style: TextStyle(
                        color: Color(0xff0EBDC8),
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () async {
                      // await getCustomerLoans();
                      Get.toNamed('/MyLoans');
                    },
                  ),
                ),
              ),
            ],
          )
        : Align(
            alignment: Alignment.topLeft,
            child: Center(
              //  width: Get.width,

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  L_Loan('Individual Loan', 'il3'),
                  L_Loan('Group Loan', 'groupl10'),
                ],
              ),
            ));
  }

  Check(title) {
    if (title == 'fill the personal information') {
      if (Global.checkP_info == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    } else if (title == "fill the financial data") {
      if (Global.checkF_info == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    } else if (title == 'fill the Loan data') {
      if (Global.checkL_info == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    } else
      return Icon(
          //check
          Icons.close,
          color: Colors.white);
  }
}
