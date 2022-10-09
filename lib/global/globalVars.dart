import 'dart:convert';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:ibda3/Login/loginController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provideri.dart';
import 'package:provider/provider.dart';

bool passwordVisibility = true;
bool pa = true;
String Gtoken;
String Gtoken41;
String GPassword;
String PP = 'No';
String lan = 'English'; //'Arabic';

String url = //'http://10.0.0.81:8031/';
// 'https://185.194.124.200:8031/';
//'https://185.194.124.201:8031/';
    'https://e-services.ibdaabanksyria.com.sy:8031/';
bool fTime;
bool register;
bool checkP_info = false;
//bool checkAttach_id = false;
bool checkL_info = false;
bool checkF_info = false;

String GIGLoan;
String GHMGLoan = 'Head';
int GCount = 0;
int indexOp = 0;

String GQRResult = '';
//int GQRResult = 0;

// class global extends StatefulWidget {
//   @override
//   _globalState createState() => _globalState();
// }
//
// class _globalState extends State<global> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
final LoginController _loginController = Get.put(LoginController());

final loanrequestController _loanrequestController =
    Get.put(loanrequestController());
getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String decision = prefs.getString('xx');
  print('PP  $decision');
  PP = decision;

  if (decision != null && decision.isNotEmpty) {
    return decision;
  } else
    return null;
}

privacPolicy() async {
  await getStringValuesSF();
  PP = await getStringValuesSF();
}

class LTF extends StatelessWidget {
  TextEditingController controller;
  String hint;
  String label;
  var ktype;

  LTF({this.controller, this.label, this.hint, this.ktype});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(height: 10),
        TF(controller, hint, ktype, false),
      ],
    );
  }
}

class TF extends StatelessWidget {
  TextEditingController tcontroller;
  String hint;
  var ktype;
  String icon;
  bool pass;
  TF(this.tcontroller, this.hint, this.ktype, this.pass, {this.icon});
  @override
  Widget build(BuildContext context) {
    //  return Text_Field(tcontroller, ktype, icon, bool pass) {
    return Container(
      height: Get.height / 10,
      child: TextFormField(
        controller: tcontroller,
        keyboardType: ktype,
        obscureText: pass == true ? Provider.of<provideri>(context).pa : false,
        decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.grey[200],
            filled: true,
            hintText: hint.tr,
            hintStyle: TextStyle(fontSize: 12),
            prefixIcon: icon != null
                ? IconButton(
                    icon: Image.asset('assets/images/icons/${icon}.png'),
                    onPressed: () {},
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  width: 1,
                )),
            suffixIcon: pass == true
                ? IconButton(
                    icon: Icon(Provider.of<provideri>(context).pa == true
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      context.read<provideri>().chang();
                      // Provider.of<provideri>(context, listen: false).chang();

                      // setState(() {
                      //  passwordVisibility =!passwordVisibility;
                      // });
                    })
                : null),
        validator: (value) =>
            value.trim().isEmpty ? hint.tr + ' is required'.tr : null,
      ),
    );
  }
}

class Custom_TF extends StatelessWidget {
  TextEditingController tcontroller;
  String lebal;
  String hint;
  var ktype;
  String icon;
  bool pass;

  Custom_TF(this.tcontroller, this.lebal, this.ktype, {this.hint, this.icon});
  @override
  Widget build(BuildContext context) {
    // return Text_Field(tcontroller, ktype, icon, bool pass) {
    return Column(
      children: [
        TextFormField(
          controller: tcontroller,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
              fillColor: Colors.grey,
              counter: Offstage(),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // counterText: "",
              // counterStyle: TextStyle(
              //   height: double.minPositive,
              // ),
              hintText: (hint == null || hint == "") ? ' ' : hint,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              labelText:
                  lebal.tr + '\n${(hint == null || hint == "") ? ' ' : hint}',
              labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).secondaryHeaderColor),
                //  when the TextFormField in focused
              ),
              border: UnderlineInputBorder()),
          keyboardType: ktype,
          validator: (value) => (value.trim().isEmpty &&
                  (lebal == 'FirstName' ||
                      lebal == 'ID (11 character)' ||
                      lebal == 'Address'
                  //         labal == 'Father Name' ||
                  //         labal == ' Mother Name' ||
                  //         labal == 'phone Number' ||
                  //         labal == 'Mobile Number' ||
                  //         labal == 'Loan value required'
                  //
                  ))
              ? lebal.tr + ' is required'.tr
              : ((lebal == 'Confirm ID') &&
                      (value.trim().compareTo(
                              _loanrequestController.IDTextController.text) !=
                          0))
                  ? 'Confirm ID not match with ID'
                  : null,
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}

class Custom_Botton extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  String text;
  Function function;
  var formkey;

  Custom_Botton(this.text, {this.function, this.formkey});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      color: Theme.of(context).secondaryHeaderColor,
      splashColor: Colors.white,
      height: 50,
      // minWidth: Get.width / 2,
      child: Text(
        text.tr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        //  if (formkey.currentState.validate()) {
        // _loginController.isLoading
        //                                 ? showDialog(
        //                                     context: context,
        //                                     child: CircularProgressIndicator())
        //                                 :

        bool isLoading;
        if (isLoading = true) {
          showDialog(
              builder: (context) => Center(
                      child: SpinKitFadingCircle(
                    color: Theme.of(context).accentColor,
                  )),
              barrierColor: Colors.white.withOpacity(0.5),
              context: context);
        }
        function();
        // _loginController.apiLogin();
        //   }
      },
    );
  }
}

class Custom_DropDown extends StatefulWidget {
  String text;
  dynamic val;
  List list;
  var formkey;

  Custom_DropDown(this.text, this.val, this.list, {this.formkey});

  @override
  _Custom_DropDownState createState() => _Custom_DropDownState();
}

class _Custom_DropDownState extends State<Custom_DropDown> {
  final loanrequestController _loanrequestController =
      Get.put(loanrequestController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        Container(
          height: 30,
          // width: 150,
          padding: EdgeInsets.only(left: 10.0, right: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 0.20),
          ),
          child: GetBuilder<loanrequestController>(builder: (controller) {
            while (widget.list == null) {
              return Center(
                  child: SpinKitFadingCircle(
                color: Theme.of(context).accentColor,
              ));
            }
            return DropdownButton(
                iconSize: 40,
                isDense: true,
                iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                iconDisabledColor: Colors.blue,
                underline: SizedBox(),
                // decoration: InputDecoration(
                //   labelText: 'Gender'.tr,
                //   labelStyle: TextStyle(color: Colors.grey),
                //   border: OutlineInputBorder(),
                //   enabledBorder: InputBorder.none,
                //),

                //  isExpanded: true,
                focusColor: Colors.blue,
                elevation: 3,
                style: TextStyle(
                  color: Colors.black,
                ),
                items: widget.list
                    // _Compulsory_service
                    .map((item) {
                  return DropdownMenuItem(
                    child: new Text(item.name),
                    value: item.id,
                  );
                }).toList(),
                onChanged: (newVal) {
                  setState(() {
                    widget.val = newVal;
                  });
                },
                value: widget.val // complaintController.time,
                );
          }),
        ),
      ],
    );
  }
}

//Map<String, dynamic>
parseJwt(String token) {
  final parts = token.split('.');

  final payload = _decodeBase64(parts[1]);

  final payloadMap = json.decode(payload);

  final g = payloadMap.toString().split(',');
  var ab = g[3].split(':');
  var ft = ab[1];
  print('3  ${ab[1]}');
  print('3  ${ft}');
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  // return payloadMap;
  return ft;
}

String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}

ShDialog(context, List<Widget> listCh, String text, Function fun1,
    {String t2 = '', Function fun2}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
          insetAnimationDuration: const Duration(milliseconds: 100),
          insetAnimationCurve: Curves.bounceInOut,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 0,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 45),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 10),
                          blurRadius: 10),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ListView(shrinkWrap: true, children: listCh),
                ),
              ),
              Positioned(
                bottom: -30,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: t2 == ''
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      //   radius: 45,
                      minRadius: 45.0,
                      maxRadius: 70.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                        child: MaterialButton(
                          onPressed: () //async
                              {
                            fun1();
                            // _statControlle.aa();
                            //
                            // setState(() {
                            //   Global.setDate = true;
                            // });
                            // Get.back();
                          },
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: Text(
                            text.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    t2 != ''
                        ? CircleAvatar(
                            backgroundColor: Colors.transparent,
                            minRadius: 45.0,
                            maxRadius: 60.0,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(45)),
                              child: MaterialButton(
                                onPressed: () //async
                                    {
                                  fun2();
                                  // _statControlle.aa();
                                  //
                                  // setState(() {
                                  //   Global.setDate = true;
                                  // });
                                  // Get.back();
                                },
                                color: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                child: Text(
                                  t2.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 1,
                          ),
                  ],
                ),
              ),
            ],
          ));
    },
  );
}

GetShDialog(List<Widget> listCh, String text, Function fun1,
    {String t2 = '', Function fun2}) {
  return Get.dialog(Dialog(
      insetAnimationDuration: const Duration(milliseconds: 100),
      insetAnimationCurve: Curves.easeInOut,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //elevation: 0,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(1),
            margin: EdgeInsets.only(bottom: 45),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ListView(shrinkWrap: true, children: listCh),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: t2 == ''
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  //   radius: 45,
                  minRadius: 45.0,
                  maxRadius: 70.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    child: MaterialButton(
                      onPressed: () //async
                          {
                        fun1();
                        // _statControlle.aa();
                        //
                        // setState(() {
                        //   Global.setDate = true;
                        // });
                        // Get.back();
                      },
                      color: Get.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        text.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                t2 != ''
                    ? CircleAvatar(
                        backgroundColor: Colors.transparent,
                        minRadius: 45.0,
                        maxRadius: 60.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          child: MaterialButton(
                            onPressed: () //async
                                {
                              fun2();
                              // _statControlle.aa();
                              //
                              // setState(() {
                              //   Global.setDate = true;
                              // });
                              // Get.back();
                            },
                            color: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              t2.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 1,
                      ),
              ],
            ),
          ),
        ],
      )));
}

buildFabCircularMenu(BuildContext ct) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: FabCircularMenu(
      //  alignment: lan == 'Arabic' ? Alignment.bottomLeft : Alignment.bottomRight,
      fabCloseColor: Colors.grey,
      fabOpenColor: Color(0xff92CA64),
      fabSize: 40,
      ringDiameter: 200,
      ringWidth: 70,
      ringColor: Color(0xff0E2947),
      // fabMargin: lan == 'Arabic'
      //     ? EdgeInsets.only(left: 15, bottom: 20)
      //     : EdgeInsets.only(right: 15, bottom: 20),
      //  fabMargin: EdgeInsets.only(right: 10.0),
      children: <Widget>[
        menuitem('loan application', 'loanreq', ct, index: 0, icon_size: 40),
        menuitem('open account', 'open', ct, index: 1, icon_size: 30)
      ],
    ),
  );
}

menuitem(String text, String icon, BuildContext context,
    {double icon_size = 90, int index}) {
  return Padding(
    padding: const EdgeInsets.only(right: 50.0, bottom: 12),
    child: InkWell(
        //   splashColor: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Image.asset('assets/images/icons/${icon}.png'),
              // tooltip: 'gggg',
              iconSize: icon_size, onPressed: () {},
            ),
            Text(
              text.tr,
              style: TextStyle(
                color: Colors.white, //Color(0xff92CA64),
                fontSize: 15,
              ),
            ),
          ],
        ),
        onTap: () {
          Get.toNamed('/Operations');
          context.read<provideri>().index_val(index);
          //Provider.of<provideri>(context, listen: false).index_val(index);
        }),
  );
}
