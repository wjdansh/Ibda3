import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:ibda3/Login/loginController.dart';
import 'dart:ui';
import '../global/globalVars.dart' as Global;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
//k import 'package:path/path.dart';

//import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'DigitalAccountController.dart';

enum ImageSourceType { gallery, camera }

class purchaseLoan extends StatefulWidget {
  @override
  _purchaseLoanState createState() => _purchaseLoanState();
}

class _purchaseLoanState extends State<purchaseLoan>
    with TickerProviderStateMixin {
  var _image;
  final ImagePicker imagePicker = new ImagePicker();
  var type;

  File imageFile;
  TextEditingController JobNumberController;
  bool checkAttach_id = false;
  Timer timer;
  final _formKey = GlobalKey<FormState>();
  var list = ['100,000', '1,000,000', '200,000', '500,000', '2,000,000'];
  final _random = new Random();
  var element;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => build(context));
    //  imagePicker = new ImagePicker();
    JobNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    element = list[_random.nextInt(list.length)];
    ListStatment(String title, String icon, Function function,
        {IconData check}) {
      return InkWell(
          child: Row(
            children: [
              Tab(
                  icon: Image.asset(
                'assets/images/icons/${icon}.png',
                height: 25,
                width: 25,
              )),
              Text("  |  ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0EBDC8),
                  )),
              Text(title.tr,
                  overflow:
                      TextOverflow.visible, //"fill  the personal information",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 5,
              ),
              Check(title),
            ],
          ),
          onTap: function);
    }

    // void _handleURLButtonPress(BuildContext context, var type) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => ImageFromGallery(type)));
    // }

    setState(() {});

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ListView(
              children: [
                ListStatment("fill the personal information", 'Pi', () {
                  Get.toNamed('/loanrequest');
                  //.then((value) => setState(() {}))
                }),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Job Number :'.tr,
                      style: TextStyle(
                          fontSize: 18, color: Colors.white.withOpacity(0.7)),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Global.TF(JobNumberController, 'Job Number',
                        TextInputType.number, false),
                  ],
                ),
                ListStatment(
                  'Attach a photo of your personal identity',
                  'Attach',
                  () {
                    openImagePicker(context);
                    // var source =
                    //     // type == ImageSourceType.camera
                    //     //     ? ImageSource.camera
                    //     //     :
                    //     ImageSource.gallery;
                    // PickedFile image = await imagePicker.pickImage(
                    //     source: source,
                    //     imageQuality: 50,
                    //     preferredCameraDevice: CameraDevice.rear);
                    // setState(() {
                    //   _image = File(image.path);
                    //   _image != null
                    //       ? checkAttach_id = true
                    //       : checkAttach_id = false;
                    // });
                  },
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          openImagePicker(context);
                          // var source =
                          //     // type == ImageSourceType.camera
                          //     //     ? ImageSource.camera
                          //     //     :
                          //     ImageSource.gallery;
                          // PickedFile image = await imagePicker.pickImage(
                          //     source: source,
                          //     imageQuality: 50,
                          //     preferredCameraDevice: CameraDevice.rear);
                          // setState(() {
                          //   _image = File(image.path);
                          //   _image != null
                          //       ? checkAttach_id = true
                          //       : checkAttach_id = false;
                          // });
                        },
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: imageFile != null
                              ? Image.file(
                                  imageFile,
                                  width: 130.0,
                                  height: 130.0,
                                  fit: BoxFit.fitHeight,
                                )
                              : Container(
                                  decoration: BoxDecoration(color: Colors.grey),
                                  width: 200,
                                  height: 200,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[800],
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
                // Column(
                //   children: [
                //     MaterialButton(
                //       color: Colors.blue,
                //       child: Text(
                //         "Pick Image from Gallery",
                //         style: TextStyle(
                //             color: Colors.white70, fontWeight: FontWeight.bold),
                //       ),
                //       onPressed: () {
                //         _handleURLButtonPress(context, ImageSourceType.gallery);
                //       },
                //     ),
                //     MaterialButton(
                //       color: Colors.blue,
                //       child: Text(
                //         "Pick Image from Camera",
                //         style: TextStyle(
                //             color: Colors.white70, fontWeight: FontWeight.bold),
                //       ),
                //       onPressed: () {
                //         _handleURLButtonPress(context, ImageSourceType.camera);
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  color: Color(0xff0EBDC8),
                  splashColor: Colors.white,
                  height: 50,
                  minWidth: Get.width / 2,
                  child: Text(
                    'Send Request'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      showDialog(
                          builder: (context) => Center(
                                  child: SpinKitFadingCircle(
                                color: Theme.of(context).accentColor,
                              )),
                          barrierColor: Colors.white.withOpacity(0.5),
                          context: context);
                      !Global.checkP_info
                          ? Global.ShDialog(
                              context,
                              [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Image.asset(
                                    'assets/images/icons/missfill.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5, top: 20, bottom: 40),
                                  child: Text(
                                    'Personal information is blank!!\n\nPlease fill out personal data and then request a Purchase Loan.'
                                        .tr,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                              'OK',
                              () {
                                Get.back();
                                Get.back();
                              },
                            )
                          /////////////////////////
// :JobNumberController.text==null?
                          : !checkAttach_id
                              ? Global.ShDialog(
                                  context,
                                  [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Image.asset(
                                        'assets/images/icons/missfill.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0,
                                          right: 5,
                                          top: 20,
                                          bottom: 40),
                                      child: Text(
                                        'Please attach a photo and try again.'
                                            .tr,
                                        style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                  'OK',
                                  () {
                                    Get.back();
                                    Get.back();
                                  },
                                )
                              /////////////////
                              : Global.GetShDialog(
                                  [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(
                                        'assets/images/icons/tax.png',
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10,
                                          top: 20,
                                          bottom: 40),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'You are entitled to a loan worth : \n'
                                                .tr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Get.theme.primaryColor,
                                                // fontWeight:
                                                //     FontWeight
                                                //         .bold,
                                                fontSize: 16),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${element} ',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    // fontWeight:
                                                    //     FontWeight
                                                    //         .bold,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                'SPY'.tr,
                                                // textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:
                                                        Get.theme.primaryColor,
                                                    // fontWeight:
                                                    //     FontWeight
                                                    //         .bold,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  'Submit',
                                  () {
                                    Get.back();
                                    Get.back();
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          Future.delayed(Duration(seconds: 5),
                                              () {
                                            Navigator.of(context).pop(true);
                                          });
                                          return Dialog(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Image.asset(
                                                      'assets/images/LoanRsuc.png',
                                                      height: 100,
                                                      width: 100,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5,
                                                            top: 70,
                                                            bottom: 10),
                                                    child: Text(
                                                      'The loan was successfully requested \n The amount will be added to your digital account'
                                                          .tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: Get.height,
                                            //   decoration: BoxDecoration(
                                            //       color: Colors.black.withOpacity(0.1),
                                            //       image: DecorationImage(
                                            //           image:
                                            //               ExactAssetImage('assets/images/LoanRsuc.png'),
                                            //           fit: BoxFit.cover)),
                                            // ),
                                          );
                                        }).then((value) => {Get.back()});
                                    // Get.dialog(
                                    //         Padding(
                                    //           padding:
                                    //               const EdgeInsets.all(20.0),
                                    //           child: Container(
                                    //             width: 50,
                                    //             height: 70,
                                    //             decoration: BoxDecoration(
                                    //               color: Colors.black
                                    //                   .withOpacity(0.3),
                                    //               // image: DecorationImage(
                                    //               //   image: ExactAssetImage('assets/images/createAccount.png'),
                                    //               //   //  fit: BoxFit.contain,
                                    //               // )
                                    //             ),
                                    //             child: Align(
                                    //               alignment:
                                    //                   Alignment.bottomCenter,
                                    //               child: Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.only(
                                    //                         bottom: 25,
                                    //                         top: 25),
                                    //                 child: Column(
                                    //                   children: [
                                    //                     Image.asset(
                                    //                       'assets/images/LoanRsuc.png',
                                    //                       width: Get.width / 2,
                                    //                       height:
                                    //                           Get.height / 2.5,
                                    //                     ),
                                    //                     SizedBox(
                                    //                       height:
                                    //                           Get.height / 8,
                                    //                     ),
                                    //                     Text(
                                    //                       'The loan was successfully requested \n The amount will be added to your digital account'
                                    //                           .tr,
                                    //                       style: TextStyle(
                                    //                           color:
                                    //                               Colors.white,
                                    //                           fontSize: 25,
                                    //                           inherit: false),
                                    //                     ),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //             // ),
                                    //           ),
                                    //         ),
                                    //         barrierColor:
                                    //             Colors.black.withOpacity(0.3),
                                    //         barrierDismissible: false)
                                    //     .then((value) => Get.back());
                                    // Confirm = true;
                                    // createDigitalAccount();
                                  },
                                  t2: 'Close',
                                  fun2: () {
                                    Get.back();
                                    Get.back();
                                  },
                                );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Check(titel) {
    if (titel == 'fill the personal information') {
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
    } else if (titel == 'Attach a photo of your personal identity') {
      if (checkAttach_id == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    }
  }

  void getImage(BuildContext context, ImageSource source) {
    imagePicker
        .getImage(source: source, maxWidth: 400, imageQuality: 100)
        .then((PickedFile image) {
      Navigator.pop(context);
      setState(() {
        imageFile = File(image.path);
        imageFile != null ? checkAttach_id = true : checkAttach_id = false;
      });

      // var source = type == ImageSourceType.camera
      //     ? ImageSource.camera
      //     : ImageSource.gallery;
      // XFile image = await imagePicker.pickImage(
      //     source: source,
      //     imageQuality: 50,
      //     preferredCameraDevice: CameraDevice.rear);
      // setState(() {
      //   _image = File(image.path);
      //   _image != null ? checkAttach_id = true : checkAttach_id = false;
      // });
    });
  }

  void openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                'Pick an Image source'.tr,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    // textColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.art_track_sharp,
                      size: 90,
                    ),
                    onPressed: () {
                      getImage(context, ImageSource.gallery);
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    // textColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.camera_alt,
                      size: 70,
                    ),
                    onPressed: () {
                      getImage(context, ImageSource.camera);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

//////////////////////////////////////////////////////////////////////

//////////////////
/////////////////////
///////////////////////////////
