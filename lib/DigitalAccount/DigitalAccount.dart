import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

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

class digitalAccount extends StatefulWidget {
  @override
  _digitalAccountState createState() => _digitalAccountState();
}

class _digitalAccountState extends State<digitalAccount>
    with TickerProviderStateMixin {
  //late TabController _tabController;
  final DigitalAccountController _digitlAccountController =
      Get.put(DigitalAccountController());
  //File
  //var image;
  File imageFile;
  final ImagePicker imagePicker = new ImagePicker();
  var type;

  bool checkAttach_id = false;
  Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => build(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 5,
          child: ListView(
            children: [
              ListStatment("fill the personal information", 'Pi', () {
                Get.toNamed('/loanrequest');
                //.then((value) => setState(() {}))
              }),
              ListStatment(
                'Attach a photo of your personal identity',
                'Attach',
                () {
                  openImagePicker(context);
                  // var source =
                  //     // type == ImageSourceType.camera
                  //     //        ? ImageSource.camera
                  //     //        :
                  //     ImageSource.gallery;
                  // try {
                  //   XFile pickedFile = await imagePicker.pickImage(
                  //       source: source,
                  //       imageQuality: 50,
                  //       preferredCameraDevice: CameraDevice.rear);
                  //   // Uint8List bytes = await image.readAsBytes();
                  //   //   String barcode = await scanner.scanBytes(bytes);
                  //   if (pickedFile == null)
                  //     return Get.snackbar('Error'.tr, '6666666666'.tr,
                  //         duration: Duration(seconds: 6),
                  //         backgroundColor: Color(0xc3cff6fa),
                  //         icon: Icon(
                  //           Icons.error_sharp,
                  //           color: Color(0xff8e0016),
                  //         ));
                  //   else
                  //     Get.snackbar('Error'.tr, '6666666666'.tr,
                  //         duration: Duration(seconds: 6),
                  //         backgroundColor: Color(0xc3cff6fa),
                  //         icon: Icon(
                  //           Icons.error_sharp,
                  //           color: Color(0xff8e0016),
                  //         ));
                  //   setState(() {
                  //     image = File(pickedFile.path);
                  //     image != null
                  //         ? checkAttach_id = true
                  //         : checkAttach_id = false;
                  //   });
                  // } catch (error) {
                  //   print("error: $error");
                  //   Get.snackbar('Error'.tr, error.toString(),
                  //       duration: Duration(seconds: 6),
                  //       backgroundColor: Color(0xc3cff6fa),
                  //       icon: Icon(
                  //         Icons.error_sharp,
                  //         color: Color(0xff8e0016),
                  //       ));
                  // }
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
                        //
                        // XFile image = await imagePicker.pickImage(
                        //   source: ImageSource.gallery,
                        //   //   imageQuality: 50,
                        //   //  preferredCameraDevice: CameraDevice.rear
                        // );
                        // Get.snackbar('Error'.tr, '6666666666'.tr,
                        //     duration: Duration(seconds: 6),
                        //     backgroundColor: Color(0xc3cff6fa),
                        //     icon: Icon(
                        //       Icons.error_sharp,
                        //       color: Color(0xff8e0016),
                        //     ));
                        // setState(() {
                        //   _image = File(image.path);
                        //   _image != null
                        //       ? checkAttach_id = true
                        //       : checkAttach_id = false;
                        // });
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: imageFile != null
                            ? Image.file(
                                imageFile,
                                width: 200.0,
                                height: 200.0,
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
                                'Personal information is blank!!\n\nPlease fill out personal data and then request a digital account.'
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
                                      left: 5.0, right: 5, top: 20, bottom: 40),
                                  child: Text(
                                    'Please attach a photo and try again.'.tr,
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
                          /////////////////
                          : {
                              _digitlAccountController.getDigitalAccount(),
                              _digitlAccountController.haveAccount == false
                                  ? _digitlAccountController
                                      .ConfirmDigitlAccount()
                                  : _digitlAccountController.digitalAccountModel
                                              .result.active ==
                                          false
                                      ? Global.ShDialog(
                                          context,
                                          [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Image.asset(
                                                'assets/images/icons/alreadyAccount.png',
                                                height: 70,
                                                width: 70,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0,
                                                  right: 5,
                                                  top: 20,
                                                  bottom: 40),
                                              child: Text(
                                                "You already have a digital account, but it's inactive."
                                                    .tr,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                      : Global.ShDialog(
                                          context,
                                          [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Image.asset(
                                                'assets/images/icons/alreadyAccount.png',
                                                height: 70,
                                                width: 70,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0,
                                                  right: 5,
                                                  top: 20,
                                                  bottom: 40),
                                              child: Text(
                                                'You already have  an active digital account.'
                                                    .tr,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                            };
                },
              ),
            ),
          ),
        ),
      ],
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
                'Pick an Image source',
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
                      Icons.art_track,
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
}

//////////////////////////////////////////////////////////////////////

//////////////////
/////////////////////

///////////////////////////////
