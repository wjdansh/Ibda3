import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../global/globalVars.dart' as Global;
import 'ComplaintController.dart';

class complaint extends StatefulWidget {
  @override
  _complaintState createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  final ComplaintController _complaintController =
      Get.put(ComplaintController());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  Global.lan == 'Arabic'
                      ? 'assets/images/logoAr.png'
                      : 'assets/images/logoEn.png',
                  width: 180,
                  height: 90,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                  thickness: 0.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              horizontalTitleGap: 1,
                              title: Text(
                                'Complaint'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              leading: Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  splashRadius: 0.8,
                                  activeColor: Colors.white,
                                  focusColor: Colors.white,
                                  value: 'complaint',
                                  groupValue: _complaintController.compval,
                                  onChanged: (newVal) {
                                    setState(() {
                                      _complaintController.compval = newVal;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              horizontalTitleGap: 1,
                              title: Text(
                                'Suggestion'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              leading: Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  hoverColor: Colors.white,
                                  activeColor: Colors.white,
                                  focusColor: Colors.white,
                                  value: 'suggestion',
                                  groupValue: _complaintController.compval,
                                  onChanged: (newVal) {
                                    setState(() {
                                      _complaintController.compval = newVal;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Global.Custom_TF(_complaintController.nameController,
                          'Name of the sender', TextInputType.text),
                      Global.Custom_TF(_complaintController.subjectController,
                          'Subject', TextInputType.text),
                      Text(
                        'Text'.tr,
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 120,
                        child: TextFormField(
                          controller:
                              _complaintController.ComplaintTextController,
                          keyboardType: TextInputType.multiline,
                          style: TextStyle(color: Colors.white),
                          // obscureText: pass == true ? Provider.of<provideri>(context).pa : false,
                          decoration: InputDecoration(
                            fillColor: Colors.black38,
                            filled: true,
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 70, left: 10),

                            //  hintText: 'text',

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Color(0xff92CA64),
                                    width: 3,
                                    style: BorderStyle.solid)),
                          ),
                          validator: (value) => value.trim().isEmpty
                              ? 'text is required'.tr
                              : null,
                        ),
                      ),
                      SizedBox(height: 20),
                      Global.Custom_Botton(
                        'Send',
                        function: () {
                          print(
                              '221133  ${_complaintController.ComplaintTextController.text}');
                          _complaintController.apiComplaint();
                        },
                        formkey: _formKey,
                      ),
                    ],
                  ),
                ),
              ),

              //   ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Global.buildFabCircularMenu(),
      floatingActionButton: Global.buildFabCircularMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ),
    );
  }
}
