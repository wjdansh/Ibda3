import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibda3/Payment/biller_form_model.dart';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

import 'package:flutter_animator/flutter_animator.dart';

import 'ServicesController.dart';

class Services extends StatefulWidget {
  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  int k = -1;

  bool select = false;
  final _formKey = GlobalKey<FormState>();
  InputSelect selected;

  final ServicesController _servicesController = Get.put(ServicesController());
  @override
  void initState() {
    super.initState();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Row(children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Theme.of(context).secondaryHeaderColor,
                size: 35,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: Center(
                child: Row(children: [
                  IconButton(
                    icon:
                        // ImageIcon(
                        //   AssetImage('assets/images/icons/${icon}.png'),
                        //   color: Theme.of(context).accentColor,
                        // ),
                        Image.network(
                      'http://185.194.124.200:8029/ImagesBiller/' +
                          _servicesController.billerIcon,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                    // Image.asset('assets/images/icons/sep/${icon}.png'),
                    // tooltip: 'gggg',
                    iconSize: 60, onPressed: () {},
                  ),
                  // Image.asset(
                  //   'assets/images/icons/sep/${_servicesController.billerIcon}.png',
                  //   width: 100,
                  //   height: 70,
                  // ),
                  Text(
                    _servicesController.billerName,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    overflow: TextOverflow.fade,
                  ),
                ]),
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Divider(
            color: Theme.of(context).secondaryHeaderColor,
            thickness: 0.5,
          ),
        ),
        Expanded(
          child: Container(
            color: Color(0xff585f67).withOpacity(0.6),
            // color: Colors.grey,
            height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width / 1.1,
            margin: EdgeInsets.only(top: 10, bottom: 80),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Column(children: [
                  Obx(() {
                    k = -1;
                    return _servicesController.billerFormFields.isEmpty
                        ? Center(
                            child: SpinKitFadingCircle(
                              color: Colors.lightGreen,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _servicesController
                                .billerFormFields.value.length,
                            itemBuilder: (context, index) {
                              BillerForm formItem = _servicesController
                                  .billerFormFields.value[index];
                              if (formItem.type == "TEXT") {
                                k++;
                                return Global.LTF(
                                  controller:
                                      _servicesController.textControllers[k],
                                  hint: '',
                                  ktype: TextInputType.text,
                                  label: Global.lan == 'Arabic'
                                      ? formItem.lableNameAr
                                      : formItem.lableNameEn,
                                );
                              } else {
                                selected = formItem.inputSelects
                                    .where((element) =>
                                        element.value ==
                                        _servicesController
                                            .selectedValues[formItem.order])
                                    .first;
                                print("after = ${selected.nameAr}");
                                return LabeledDroDown(
                                    text: Global.lan == 'Arabic'
                                        ? formItem.lableNameAr
                                        : formItem.lableNameEn,
                                    list: formItem.inputSelects
                                        .map((item) =>
                                            DropdownMenuItem<InputSelect>(
                                                child: Text(
                                                    Global.lan == 'Arabic'
                                                        ? item.nameAr
                                                        : item.nameEn),
                                                value: item))
                                        .toList(),
                                    val: selected,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selected = newValue;
                                        _servicesController.selectedValues[
                                            formItem.order] = selected.value;
                                        print("on change = ${selected.nameAr}");
                                      });
                                    });
                              }
                            });
                  }),
                  SizedBox(height: 30),
                  Global.Custom_Botton(
                    'Bill Inquiry',
                    function: () {
                      _servicesController.getBills();

                      Navigator.of(context).pop();
                      // _servicesController.getCustomerBills();
                      print(
                          "Service Arguma ${_servicesController.formValues.toJson()}");
                      Get.toNamed('/bills',
                          arguments: [_servicesController.formValues]);
                    },
                    formkey: _formKey,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: Global.buildFabCircularMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class LabeledDroDown extends StatelessWidget {
  String text;
  dynamic val;
  List list;
  void Function(dynamic) onChanged;

  LabeledDroDown({this.text, this.list, this.val, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
        ),
        Flexible(
          child: Container(
            height: 36,
            width: Get.width / 1.7,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 0.20),
            ),
            child: DropdownButton(
              iconSize: 40,
              alignment: Alignment.center,
              hint: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              // buttonHeight: 40,
              // buttonWidth: 140,
              // itemHeight: 40,
              iconEnabledColor: Theme.of(context).secondaryHeaderColor,
              iconDisabledColor: Colors.blue,
              underline: SizedBox(),
              focusColor: Colors.blue,
              style: TextStyle(
                color: Colors.black,
              ),
              items: list,
              onChanged: onChanged,
              value: val, // complaintController.time,
            ),
          ),
        ),
      ]),
    );
  }
}
