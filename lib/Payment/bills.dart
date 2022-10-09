import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ibda3/Payment/infoPayModel.dart';

import 'billesController.dart';

var height;
var width;

int loanProcess_id;

String stateLoan;

class MyBills extends StatefulWidget {
  const MyBills({Key key}) : super(key: key);

  @override
  _MyBillsState createState() => _MyBillsState();
}

class _MyBillsState extends State<MyBills> {
  final billesController _billesController = Get.put(billesController());

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/bill.png',
                          width: 50,
                          height: 30,
                        ),
                        Text("My Bills".tr,
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
                      width: Get.width,
                      height: Get.height / 1.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              flex: 6,
                              child: Obx(() {
                                if (_billesController.errorB == true) {
                                  return Container(
                                    padding: EdgeInsets.only(top: 90),
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          _billesController.errorBills
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                                  );
                                } else if (_billesController
                                    .infoPayList.value.isEmpty) {
                                  return Center(
                                      child: SpinKitFadingCircle(
                                    color: Theme.of(context).accentColor,
                                  ));
                                } else {
                                  return ListView.builder(
                                      itemCount: _billesController.infoPayList
                                          .value.length, //resultList.length,
                                      itemBuilder: (context, i) {
                                        List<BillingsRec> bills =
                                            _billesController.infoPayList.value;
                                        return Obx(
                                          () => CheckboxListTile(
                                            title: cardBills(
                                              bills[i].billingNo,
                                              bills[i].dueAmount,
                                              bills[i].feeAmount,
                                              bills[i].openDate,
                                              bills[i].dueDate,
                                              bills[i].billStatus,
                                              bills[i].message,
                                              bills[i].billStatus == "BillNew",
                                              shape: _billesController
                                                      .isChecked.value[i]
                                                  ? RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0))
                                                  : RoundedRectangleBorder(
                                                      //  side: new BorderSide(color: Colors.white, width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)),
                                            ),
                                            value: _billesController
                                                .isChecked.value[i],
                                            onChanged: (val) {
                                              _billesController.onBillSelected(
                                                  i, val);
                                            },
                                            enabled: bills[i].billStatus ==
                                                "BillNew",
                                          ),
                                        );
                                      });
                                }
                              })),
                          Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Divider(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Obx(
                                        () => Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text('Unpaid invoices',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor)),
                                                  Text(
                                                      ' ${_billesController.unpaided}',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text('Total invoice value',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor)),
                                                  Text(
                                                      " ${_billesController.totalUnpaid.value}",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text('Selected invoices',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor)),
                                                  Text(
                                                      " ${_billesController.checkedBills.value.length}",
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                      'selected invoices value',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .secondaryHeaderColor)),
                                                  Text(
                                                      _billesController
                                                          .totalSelected
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 60),
                                    child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        splashColor: Colors.white,
                                        height: 50,
                                        minWidth: Get.width / 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'pay'.tr,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 26,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            ImageIcon(
                                              AssetImage(
                                                  'assets/images/icons/payment1.png'),
                                              size: 50,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          showDialog(
                                              builder: (context) => Center(
                                                      child:
                                                          SpinKitFadingCircle(
                                                    color: Theme.of(context)
                                                        .accentColor,
                                                  )),
                                              barrierColor:
                                                  Colors.white.withOpacity(0.5),
                                              context: context);
                                          _billesController.payBills();
                                          //buildShowDialog(context);
                                        }),
                                  ),
                                ],
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  cardBills(String billNumber, double dueAmount, double Fee, DateTime openDate,
      DateTime dueDate, String billStatus, String Message, bool enabled,
      {shape}) {
    print("bill number is ${openDate.toString()} & message is ${Message}");
    return Container(
      child: Card(
        color: enabled ? Colors.transparent : Colors.grey.withOpacity(0.3),
        shape: shape,
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                richTextB('Bill Number: ', billNumber, enabled),
                richTextB('Due Amount:', dueAmount.toString(), enabled),
                richTextB('Fee: ', Fee.toString(), enabled),
                richTextB('Open Date:', openDate.toString().substring(0, 10),
                    enabled),
                richTextB(
                    'Due Date:', dueDate.toString().substring(0, 10), enabled),
                richTextB('Bill Status:', billStatus, enabled),
                richTextB('Message:', Message, enabled),
              ],
            ),
          ),
        ),
      ),
    );
  }

  richTextB(String label, String dis, bool enabled) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: label,
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 16,
                  letterSpacing: 2,
                )),
            TextSpan(
              text: dis,
              style: TextStyle(
                color: enabled ? Colors.white : Colors.grey.shade400,
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
          "Account Number".tr,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
              child: Text("Submit", style: TextStyle(color: Colors.black)),
              onPressed: () {}),
          TextButton(
            child: Text("Back", style: TextStyle(color: Colors.black)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        content: TextFormField(
          controller: _billesController.accountNumberController,
          style: TextStyle(color: Color(0xff0E2947)),
          decoration: InputDecoration(
              fillColor: Colors.grey,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Account Number".tr,
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
        ),
      ),
    );
  }
}
