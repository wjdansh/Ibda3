import 'dart:convert';
import 'dart:ffi';

import 'dart:math';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import 'package:ibda3/Loanrequest/MilitaryModel.dart';
import '../global/globalVars.dart' as Global;
import 'CustomerModel.dart';
import 'KycModel.dart';
import 'groupLoanModel.dart';
import 'headModel.dart';

class loanrequestController extends GetxController {
  TextEditingController firstnameTextController;
  TextEditingController lastnameTextController;
  TextEditingController fathernameTextController;
  TextEditingController mothernameTextController;
  TextEditingController motherLastNameController;
  TextEditingController userNameController;
  TextEditingController IDTextController;
  TextEditingController mobileTextController;
  TextEditingController phoneTextController;
  TextEditingController Confirm_IDTextController;
  TextEditingController DocumentTextController;
  TextEditingController husbandnameTextController;
  TextEditingController husbandidTextController;
  TextEditingController childrenCountController;
  TextEditingController numdependantsTextController;
  TextEditingController addressTextController;
  TextEditingController cause_exemptionTextController;
  TextEditingController home_rentTextController;

  TextEditingController ProfessionController;
  TextEditingController MonthlyIncomeController;
  TextEditingController PremiumAController;
  TextEditingController loanPaymentController;
  TextEditingController MonthlyexpensesController;
  TextEditingController loanamountController;

  TextEditingController projectOwnerController;
  TextEditingController projectNameController;
  TextEditingController WorkAddressController;
  TextEditingController MonthlySTextController;
  TextEditingController RentalController;

  TextEditingController PermanentEmployeesController;
  TextEditingController TemporaryEmployeesController;
  TextEditingController fuelController;
  TextEditingController maintenanceController;
  TextEditingController SalariesOfEmployeesController;
  TextEditingController goodsController;
  TextEditingController equipmentController;
  TextEditingController phoneProjectController;
  TextEditingController PropertyOwnerController;
  TextEditingController ExperienceYearsController;

  TextEditingController CustomerDebtController;
  TextEditingController SupplierDebtController;
  TextEditingController LoanValueController;
  TextEditingController PaymentController;
  TextEditingController instalmentsController;
  TextEditingController PurposeController;

  TextEditingController N_NumberTextController;

  // bool isLoading=true;

  String valbirthday;
  String valStart = '2020-04-1';
  String valEnd = '2022-04-2';
  String valgen;

  int valmarital;
  int valmilitary;
  int valresidency;
  int valresidencyS;
  int valelevel;

  int valjob;
  int valdeal;
  int valbanks;
  int valVillages;
  int valInstitutionIW;
  int valProjectStates;
  String valLoanOfficer;
  int valGroupMembers;

  bool isLoading = true;
  bool log;
  String PIN;
  Error err;
  CustomerModel C_List;
  CustomerModel customerModel;
  KycModel Kyc_List;
  KycModel _kycModel;
  ErrorRe result;
  GroupLoanModel groupLoanModel;
  LoanInfo loanInfo;
  ProjectInfo projectInfo;
  var gl;
  var ll;
  var pl;
  var cc;
  var cv;
  var ct;
  var cx;
  List G_Loan;
  List<bool> isChecked;
  List<GroupLoanModel> G_Loan2;
  String headval;
  String headva = ' No head '.tr;
  // xValues[index].toDouble() * yValues[index].toDouble();
  // var v = LoanValueController.toDouble().times(instalmentsController);
  int Loanv;
  int count;
  List<int> checkedMember;
  List<dynamic> errorlist;
  ErrorRResult erl;
  headModel headM;
  List<MilitaryModel> militarymod;
  List<MilitaryModel> militarylist;
  List<MilitaryModel> maritalmod;
  List<MilitaryModel> maritallist;
  List<MilitaryModel> Residencymod;
  List<MilitaryModel> Residencylist;

  List<MilitaryModel> ResidencySmod;
  List<MilitaryModel> ResidencySlist;

  List<MilitaryModel> EducationLevelsmod;
  List<MilitaryModel> EducationLevelslist;
  List<MilitaryModel> JobTypemod;
  List<MilitaryModel> JobTypelist;
  List<MilitaryModel> DealTypemod;
  List<MilitaryModel> DealTypelist;

  List<MilitaryModel> Banksmod;
  List<MilitaryModel> Bankslist;

  List<MilitaryModel> InstitutionIWmod;
  List<MilitaryModel> InstitutionIWlist;

  List<LoanOfficerModel> Villagesmod;
  List<LoanOfficerModel> Villageslist;

  List<LoanOfficerModel> LoanOfficermod;
  List<LoanOfficerModel> LoanOfficerlist;

  List<LoanOfficerModel> GroupMembersmod;
  List<LoanOfficerModel> GroupMemberslist;

  List<LoanOfficerModel> ProjectStatesmod;

  List<LoanOfficerModel> ProjectStateslist;
  static final now = DateTime.now();
  final dropdownDatePicker = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, //color: Color(0xff0EBDC8)
        color: Color(0xff0E2947).withOpacity(0.8)),
    dropdownColor: Colors.blue[50],
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    ascending: false,
    underLine: SizedBox(),
  );
  final dropdownDatePickerStart = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, //color: Color(0xff0EBDC8)
        color: Color(0xff0E2947).withOpacity(0.8)),
    dropdownColor: Colors.blue[50],
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    ascending: false,
    underLine: SizedBox(),
  );
  final dropdownDatePickerEnd = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year + 10, month: 1, day: 1),
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, //color: Color(0xff0EBDC8)
        color: Color(0xff0E2947).withOpacity(0.8)),
    dropdownColor: Colors.blue[50],
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    ascending: false,
    underLine: SizedBox(),
  );
  // DropdownDatePicker dropdownDatePickerbirth;
  // DropdownDatePicker dropdownDatePickerStart;
  // DropdownDatePicker dropdownDatePickerEnd;
  // static final now = DateTime.now();
  @override
  void onInit() async {
    //LoanOfficerlist = [];
    // await apiLR();
    headval = await apiGroupHead();
    Kyc_List = await apiGetBasicInfo();

    //  C_List = await api();
    //  GroupMemberslist = [];

    //

    (Kyc_List == null) ? Global.checkP_info = false : Global.checkP_info = true;
    Global.checkP_info == true ? financialInfo() : null;

    // {
    //   Global.checkP_info = true,
    // // Global.checkP_info == true ? _loanrequestController.financialInfo() : null;
    // financialInfo()
    // };

    groupLoanModel = GroupLoanModel();

    loanInfo = new LoanInfo();
    projectInfo = new ProjectInfo();
    G_Loan = [];
    checkedMember = [];

    firstnameTextController = TextEditingController();
    lastnameTextController = TextEditingController();
    fathernameTextController = TextEditingController();
    mothernameTextController = TextEditingController();
    motherLastNameController = TextEditingController();
    userNameController = TextEditingController();

    DocumentTextController = TextEditingController();
    mobileTextController = TextEditingController();
    IDTextController = TextEditingController();
    Confirm_IDTextController = TextEditingController();
    phoneTextController = TextEditingController();
    husbandnameTextController = TextEditingController();
    husbandidTextController = TextEditingController();
    childrenCountController = TextEditingController();
    numdependantsTextController = TextEditingController();
    addressTextController = TextEditingController();
    cause_exemptionTextController = TextEditingController();
    home_rentTextController = TextEditingController();

    ProfessionController = TextEditingController();
    MonthlyexpensesController = TextEditingController();
    PremiumAController = TextEditingController();
    MonthlyIncomeController = TextEditingController();
    loanPaymentController = TextEditingController();
    loanamountController = TextEditingController();

    projectOwnerController = TextEditingController();
    projectNameController = TextEditingController();
    WorkAddressController = TextEditingController();
    MonthlySTextController = TextEditingController();
    RentalController = TextEditingController();

    PermanentEmployeesController = TextEditingController();
    TemporaryEmployeesController = TextEditingController();
    fuelController = TextEditingController();
    maintenanceController = TextEditingController();
    SalariesOfEmployeesController = TextEditingController();
    goodsController = TextEditingController();
    equipmentController = TextEditingController();

    CustomerDebtController = TextEditingController();
    SupplierDebtController = TextEditingController();
    LoanValueController = TextEditingController();
    PaymentController = TextEditingController();
    instalmentsController = TextEditingController();
    PurposeController = TextEditingController();
    phoneProjectController = TextEditingController();
    PropertyOwnerController = TextEditingController();
    ExperienceYearsController = TextEditingController();

    N_NumberTextController = TextEditingController();

    //valLoanOfficer = 'bb';

    militarylist = await apiGetIndex(
        'api/MilitaryStatuses/IndexGet', militarymod, MilitaryModelFromJson);
    maritallist = await apiGetIndex(
        'api/SocialStatuses/IndexGet', maritalmod, MilitaryModelFromJson);
    Residencylist = await apiGetIndex(
        'api/ResidencyTypes/IndexGet', Residencymod, MilitaryModelFromJson);
    ResidencySlist = await apiGetIndex(
        'api/ResidencyStatuses/IndexGet', ResidencySmod, MilitaryModelFromJson);
    EducationLevelslist = await apiGetIndex('api/EducationLevels/IndexGet',
        EducationLevelsmod, MilitaryModelFromJson);
    JobTypelist = await apiGetIndex(
        'api/JobTypes/IndexGet', JobTypemod, MilitaryModelFromJson);
    DealTypelist = await apiGetIndex(
        'api/DealTypes/IndexGet', DealTypemod, MilitaryModelFromJson);
    Bankslist = await apiGetIndex(
        'api/Banks/IndexGet', Banksmod, MilitaryModelFromJson);
    //  Villageslist = await apiGetVillages();
    InstitutionIWlist = await apiGetIndex(
        'api/InstitutionIdentificationWays/IndexGet',
        InstitutionIWmod,
        MilitaryModelFromJson);
    ProjectStateslist = await apiGetIndex('api/ProjectStates/IndexGet',
        ProjectStatesmod, LoanOfficerModelFromJson);

    // LoanOfficerlist = await apiGetIndex('api/LoanRequests/GetLoanOfficers',
    //     LoanOfficermod, LoanOfficerModelFromJson);

    LoanOfficerlist = await apiGetLoanOfficer();
    GroupMemberslist = await apiGetIndex('api/Customers/GetGroupMembers',
        GroupMembersmod, LoanOfficerModelFromJson);
    Villageslist = await apiGetIndex(
        'api/Villages/IndexGet', Villagesmod, LoanOfficerModelFromJson);

    isChecked = List<bool>.filled(
        GroupMemberslist.length != 0 ? GroupMemberslist.length : 0, false);
    //  print('response   ${customerModel.userId}');
    super.onInit();
  }

  api() async {
    final url = Global.url + 'api/Customers/SelfGet';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        customerModel = CustomerModelFromJson(response.body);

        return customerModel;
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error'.tr, e.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  apiGetBasicInfo() async {
    String s;
    final url = Global.url + 'api/Customers/SelfGetBasicInfo';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        result = ErrorReFromJson(response.body);
        result.hasErrors == true
            ? _kycModel = null
            : _kycModel = kycModelFromJson(response.body);

        return _kycModel;
        // api();
        // return result;
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error'.tr, e.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  Future apiCreateBasicInfo(BuildContext context) async {
    print('apiDAccount is called');

    //final url1 = Global.url + 'api/Customers/SelfGetBasicInfo';
    final url = Global.url + 'api/Customers/SelfCreateBasicInfo';
    //final url3 = Global.url + 'api/Customers/SelfCreateBasicInfo';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    var body = {
      'firstName': firstnameTextController.text,
      'lastName': lastnameTextController.text,
      'fatherName': fathernameTextController.text,
      'motherName': mothernameTextController.text,
      'motherLastName': motherLastNameController.text,
      'userName': userNameController.text,
      'phoneNumber': phoneTextController.text,
      'mobileNumber': mobileTextController.text,
      'villageId': valVillages,
      'address': addressTextController.text,
      'birthDate': valbirthday,
      'nationalNumber': IDTextController.text,
      "nationalNumberConfirm": Confirm_IDTextController.text,
      'gender': valgen,
      // 'docNumber': Confirm_IDTextController.text,

      'socialStatusId': valmarital,

      'residencyTypeId': valresidency,
      //'residencyStatusId': '3',
      //  'rentAmount': '12',
      //  'jobTypeId': 1,
      'employeeMonthlyIncome': MonthlyIncomeController.text,
      "yearlyIncome": double.parse(MonthlyIncomeController.text) * 12,
      // 'monthlyExpenses': '12',
      // "professionId": 2,
      // "customerBankDeals": [
      //   {
      //     "bankId": valbanks == null ? 3 : valbanks,
      //     "dealTypeId": valdeal == null ? 2 : valdeal,
      //   }
      // ],
      // "selfCreated": true,
      // 'loanRequests': loanamountController.text,

      // isGuarantor	boolean
      // 'guarantorType': ,
      // 'customerPatchInfoId': ,
      // 'customerPatchInfo': ,
    };

    {
      try {
        final http.Response respons = await http.post(
          Uri.parse(url),
          headers: header,
          body: jsonEncode(body),
        );
        print(respons.statusCode);
        print(respons.body);
        if (respons.statusCode == 200) {
          result = ErrorReFromJson(respons.body);
          result.hasErrors == false
              ? showDialog(
                  context: context,
                  builder: (_) {
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.of(context).pop(true);
                    });
                    return Dialog(
                      backgroundColor: Colors.black.withOpacity(0.1),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(
                                'assets/images/done.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5, top: 20, bottom: 40),
                              child: Text(
                                'The data was successfully filled out'.tr,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   width: 150,
                      //   height: 250,
                      //   decoration: BoxDecoration(
                      //       color: Colors.black.withOpacity(0.1),
                      //       image: DecorationImage(
                      //         image: ExactAssetImage('assets/images/done.png'),
                      //         //fit: BoxFit.scaleDown
                      //       )),
                      // ),
                    );
                  }).then((value) => {
                    Global.checkP_info = true,
                    Get.back(),
                    Get.back(),
                  })
              : {
                  Get.back(),
                  Get.snackbar('Error'.tr, result.validationErrors[0].errors[0],
                      duration: Duration(seconds: 6),
                      backgroundColor: Color(0xc3cff6fa),
                      icon: Icon(
                        Icons.error_sharp,
                        color: Color(0xff8e0016),
                      )),
                };
        } else {
          errorlist = json.decode(respons.body);

          // Get.back();
          Get.snackbar(errorlist[0]['field'].toString(),
              errorlist[0]['errors'].toString(),
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));
        }
      } catch (e) {
        Get.back();
        Get.snackbar('Error'.tr, 'Please check Internet connection'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    }
    ;
  }

  Future apiloanreq(BuildContext context) async {
    final url1 = Global.url + 'api/Customers/SelfGet';
    final url2 = Global.url + 'api/Customers/SelfEdit';

    void onInit() async {
      C_List = await api();
    }

    onInit();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    var body = {
      // "id": C_List.id,
      'firstName': C_List.firstName.toString(),
      'lastName': C_List.lastName.toString(),
      'fatherName': C_List.fatherName.toString(),
      'motherName': C_List.motherName.toString(),
      'motherLastName': C_List.motherLastName.toString(),
      'userName': C_List.userName.toString(),
      'phoneNumber': C_List.phoneNumber.toString(),
      'mobileNumber': C_List.mobileNumber.toString(),
      'villageId': C_List.villageId,
      'address': C_List.address.toString(),
      'birthDate': C_List.birthDate.toString(),
      'nationalNumber': C_List.nationalNumber.toString(),
      'gender': C_List.gender.toString(),
      // 'docNumber': C_List.d,
      'dependentsNumber': numdependantsTextController.text,

      'socialStatusId': C_List.socialStatusId, //1, //
      'socialPartnerName': husbandnameTextController.text,
      //C_List.socialPartnerName.toString(),
      'socilaPartnerNationalNumber': husbandidTextController.text,
      // C_List.socilaPartnerNationalNumber.toString(),
      'childrenCount': childrenCountController.text,
      'educationLevelId': valelevel, // C_List.educationLevelId,
      'militaryStatusId': valmilitary, //C_List.militaryStatusId,

      'militaryStatusNotes': cause_exemptionTextController.text,
      'residencyTypeId': C_List.residencyTypeId, //3,
      'residencyStatusId': valresidencyS, //'2', //C_List.residencyStatusId,
      'rentAmount': home_rentTextController.text,
      'jobTypeId': valjob,
      'employeeMonthlyIncome': C_List.employeeMonthlyIncome.toString(),
      'monthlyExpenses': MonthlyexpensesController.text,
      "professionId": 7,
      // "customerBankDeals": [
      //   {
      //     "bankId": valbanks == null ? 3 : valbanks,
      //     "dealTypeId": valdeal == null ? 2 : valdeal,
      //   }
      // ],
      "selfCreated": true,
      // 'loanRequests': loanamountController.text,

      // isGuarantor	boolean
      // 'guarantorType': ,
      // 'customerPatchInfoId': ,
      // 'customerPatchInfo': ,
    };

    try {
      // final http.Response response = await http.get(
      //   Uri.parse(url1),
      //   headers: header,
      // );
      // print(response.statusCode);
      // print(response.body);
      // if (response.statusCode == 200) {
      //   customerModel = CustomerModelFromJson(response.body);

      var respons = await http.post(
        Uri.parse(url2),
        headers: header,
        body: jsonEncode(body),
      );
      print(respons.statusCode);
      print(respons.body);

      if (respons.statusCode == 200) {
        isLoading = false;
        showDialog(
            context: context,
            builder: (_) {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.of(context).pop(true);
              });
              return Dialog(
                backgroundColor: Colors.black.withOpacity(0.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset(
                        'assets/images/done.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5, top: 20, bottom: 40),
                      child: Text(
                        'The data was successfully filled out'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: 150,
                //   height: 250,
                //   decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(0.1),
                //       image: DecorationImage(
                //         image: ExactAssetImage('assets/images/done.png'),
                //         //fit: BoxFit.scaleDown
                //       )),
                // ),
              );
            }).then((value) => {
              Global.checkF_info = true,
              Get.back(),
              Get.back(),
            });
      }
      //
      // else if (respons.statusCode == 400) {
      //   Get.back();
      //   Get.snackbar('Error'.tr, 'bad request'.tr,
      //       duration: Duration(seconds: 6),
      //       backgroundColor: Color(0xc3cff6fa),
      //       icon: Icon(
      //         Icons.error_sharp,
      //         color: Color(0xff8e0016),
      //       ));
      // }
      else {
        errorlist = json.decode(respons.body);

        Get.back();
        Get.snackbar(
            errorlist[0]['field'].toString(), errorlist[0]['errors'].toString(),
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
      // }
      //       print(err);
      //       Get.back();
      //       Get.snackbar('Error'.tr, 'Not a valid email address'.tr,
      //           duration: Duration(seconds: 6),
      //           backgroundColor: Color(0XFFFFDDDA),
      //           icon: Icon(
      //             Icons.error_sharp,
      //             color: Color(0xff8e0016),
      //           ));
      //     } else {
      //       logUserModel = logInUserModel.fromJson(json.decode(response.body));
      //       log = logUserModel.successed;
      //
      //       if (response.statusCode == 200 && log == true) {
      //         Global.Gtoken = logUserModel.token;
      //         Get.back();
      //         Get.toNamed("/otp");
      //         emailTextController.clear();
      //         passwordTextController.clear();
      //       } else if (response.statusCode == 200 && log == false) {
      //         Get.back();
      //         Get.snackbar('Error'.tr, logUserModel.errors.toString().tr,
      //             duration: Duration(seconds: 6),
      //             backgroundColor: Color(0XFFFFDDDA),
      //             icon: Icon(
      //               Icons.error_sharp,
      //               color: Color(0xff8e0016),
      //             ));
      //       }
      //     }
    } catch (e) {
      // Get.back();
      Get.snackbar('Error'.tr, 'Please check connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  Future apiloanreqstat(BuildContext context) async {
    print('api called 222');

    print(
        '222  ${double.parse(LoanValueController.text) * double.parse(PaymentController.text)}');

    Map<String, String> header = {
      'Content-Type': 'application/json',
      // 'Content-Type': 'application/json;'
      //     ' charset=utf-8',
      'Authorization': Global.Gtoken,
    };
    print('api32');
    var body = {
      'loanServiceId': Loanv,
      'loanInfo': {
        'amount': double.parse(instalmentsController.text) *
            double.parse(PaymentController.text),
        'possiblePaymentAmount': PaymentController.text,
        'installmentsCount': instalmentsController.text,
        'loanReason': PurposeController.text,
        'institutionIdentificationWayId': valInstitutionIW,
      },
      'projectInfo': {
        'projectName': projectNameController.text,
        'projectOwner': projectOwnerController.text,
        'projectAddress': WorkAddressController.text,
        'phone': phoneProjectController.text,
        'propertyOwner': projectOwnerController.text,
        'experienceYears': ExperienceYearsController.text,
        'projectStateId': valProjectStates,
        // projectState	ProjectState{...}
        'projectResidentRent': RentalController.text,
        'contractStartDate': valStart,
        'contractEndDate': valEnd,
        'monthlySales': MonthlySTextController.text,
        'permanentWorkers': PermanentEmployeesController.text,
        'temporalWorkers': TemporaryEmployeesController.text,
        'fule': fuelController.text,
        'maintenance': maintenanceController.text,
        'workersSalaries': SalariesOfEmployeesController.text,
        'goodsEstimatedValue': goodsController.text,
        'equipmentEstimatedValue': equipmentController.text,
        'customersDeptBalance': CustomerDebtController.text,
        'suppliersDebtBalance': SupplierDebtController.text,
      },
      'loanOfficerUserId': valLoanOfficer,
      "SelfCreated": true,

      // LoanValueController,
      // PaymentController,
      // instalmentsController,
      // PurposeController,
    };
    print('api 522');
    var bodyG = {
      'loanServiceId': Loanv,
      'loanOfficerUserId': valLoanOfficer,
      'SelfCreated': true,
      'loanInfo': Global.GIGLoan == 'Group Loan' ? jsonDecode(ll) : '',
      'projectInfo': Global.GIGLoan == 'Group Loan' ? jsonDecode(pl) : '',
      // 'customerId': '2345',
      // 'loanInfo': {
      //   'amount': G_Loan[0].loanInfo.amount.toString(),
      //   'possiblePaymentAmount':
      //       G_Loan[0].loanInfo.possiblePaymentAmount.toString(),
      //   'installmentsCount': G_Loan[0].loanInfo.installmentsCount.toString(),
      //   'loanReason': G_Loan[0].loanInfo.loanReason,
      //   'institutionIdentificationWayId':
      //       G_Loan[0].loanInfo.institutionIdentificationWayId.toString(),
      // },
      // 'projectInfo': {
      //   'projectName': G_Loan[0].projectInfo.projectName.toString(),
      //   'projectOwner': G_Loan[0].projectInfo.projectOwner.toString(),
      //   'projectAddress': G_Loan[0].projectInfo.projectAddress.toString(),
      //   'phone': G_Loan[0].projectInfo.phone.toString(),
      //   'propertyOwner': G_Loan[0].projectInfo.propertyOwner.toString(),
      //   'experienceYears': G_Loan[0].projectInfo.experienceYears.toString(),
      //   'projectStateId': G_Loan[0].projectInfo.projectStateId.toString(),
      //   'projectResidentRent':
      //       G_Loan[0].projectInfo.projectResidentRent.toString(),
      //   'contractStartDate': G_Loan[0].projectInfo.contractStartDate.toString(),
      //   'contractEndDate': G_Loan[0].projectInfo.contractEndDate.toString(),
      //   'monthlySales': G_Loan[0].projectInfo.monthlySales.toString(),
      //   'permanentWorkers': G_Loan[0].projectInfo.permanentWorkers.toString(),
      //   'temporalWorkers': G_Loan[0].projectInfo.temporalWorkers.toString(),
      //   'fule': G_Loan[0].projectInfo.fule.toString(),
      //   'maintenance': G_Loan[0].projectInfo.maintenance.toString(),
      //   'workersSalaries': G_Loan[0].projectInfo.workersSalaries.toString(),
      //   'goodsEstimatedValue':
      //       G_Loan[0].projectInfo.goodsEstimatedValue.toString(),
      //   'equipmentEstimatedValue':
      //       G_Loan[0].projectInfo.equipmentEstimatedValue.toString(),
      //   'customersDeptBalance':
      //       G_Loan[0].projectInfo.customersDeptBalance.toString(),
      //   'suppliersDebtBalance':
      //       G_Loan[0].projectInfo.suppliersDebtBalance.toString(),
      // },

      'groupLoanCustomers':
          Global.GIGLoan == 'Group Loan' ? jsonDecode(G_Loan.toString()) : '',
      // for (int i = 1; i < G_Loan.length; i++)
      //   {
      //
      //     // {
      //     //   'loanInfo': {
      //     //     'amount': G_Loan[i].loanInfo.amount.toString(),
      //     //     'possiblePaymentAmount':
      //     //         G_Loan[i].loanInfo.possiblePaymentAmount.toString(),
      //     //     'installmentsCount':
      //     //         G_Loan[i].loanInfo.installmentsCount.toString(),
      //     //     'loanReason': G_Loan[i].loanInfo.loanReason.toString(),
      //     //     'institutionIdentificationWayId': G_Loan[i]
      //     //         .loanInfo
      //     //         .institutionIdentificationWayId
      //     //         .toString(),
      //     //   },
      //     //   'projectInfo': {
      //     //     'projectName': G_Loan[i].projectInfo.projectName.toString(),
      //     //     'projectOwner': G_Loan[i].projectInfo.projectOwner.toString(),
      //     //     'projectAddress':
      //     //         G_Loan[i].projectInfo.projectAddress.toString(),
      //     //     'phone': G_Loan[i].projectInfo.phone.toString(),
      //     //     'propertyOwner': G_Loan[i].projectInfo.propertyOwner.toString(),
      //     //     'experienceYears':
      //     //         G_Loan[i].projectInfo.experienceYears.toString(),
      //     //     'projectStateId':
      //     //         G_Loan[i].projectInfo.projectStateId.toString(),
      //     //     'projectResidentRent':
      //     //         G_Loan[i].projectInfo.projectResidentRent.toString(),
      //     //     'contractStartDate':
      //     //         G_Loan[i].projectInfo.contractStartDate.toString(),
      //     //     'contractEndDate':
      //     //         G_Loan[i].projectInfo.contractEndDate.toString(),
      //     //     'monthlySales': G_Loan[i].projectInfo.monthlySales.toString(),
      //     //     'permanentWorkers':
      //     //         G_Loan[i].projectInfo.permanentWorkers.toString(),
      //     //     'temporalWorkers':
      //     //         G_Loan[i].projectInfo.temporalWorkers.toString(),
      //     //     'fule': G_Loan[i].projectInfo.fule.toString(),
      //     //     'maintenance': G_Loan[i].projectInfo.maintenance.toString(),
      //     //     'workersSalaries':
      //     //         G_Loan[i].projectInfo.workersSalaries.toString(),
      //     //     'goodsEstimatedValue':
      //     //         G_Loan[i].projectInfo.goodsEstimatedValue.toString(),
      //     //     'equipmentEstimatedValue':
      //     //         G_Loan[i].projectInfo.equipmentEstimatedValue.toString(),
      //     //     'customersDeptBalance':
      //     //         G_Loan[i].projectInfo.customersDeptBalance.toString(),
      //     //     'suppliersDebtBalance':
      //     //         G_Loan[i].projectInfo.suppliersDebtBalance.toString(),
      //     //   },
      //     //   "customerId": checkedMember[i].toString(),
      //     // },
      //   },
      // {
      //   'loanInfo': {
      //     'amount': double.parse(instalmentsController.text) *
      //         double.parse(PaymentController.text),
      //     'possiblePaymentAmount': PaymentController.text,
      //     'installmentsCount': instalmentsController.text,
      //     'loanReason': PurposeController.text,
      //     'institutionIdentificationWayId': valInstitutionIW,
      //   },
      //   'projectInfo': {
      //     'projectName': projectNameController.text,
      //     'projectOwner': projectOwnerController.text,
      //     'projectAddress': WorkAddressController.text,
      //     'phone': phoneProjectController.text,
      //     'propertyOwner': projectOwnerController.text,
      //     'experienceYears': ExperienceYearsController.text,
      //     'projectStateId': valProjectStates,
      //     'projectResidentRent': RentalController.text,
      //     'contractStartDate': valStart,
      //     'contractEndDate': valEnd,
      //     'monthlySales': MonthlySTextController.text,
      //     'permanentWorkers': PermanentEmployeesController.text,
      //     'temporalWorkers': TemporaryEmployeesController.text,
      //     'fule': fuelController.text,
      //     'maintenance': maintenanceController.text,
      //     'workersSalaries': SalariesOfEmployeesController.text,
      //     'goodsEstimatedValue': goodsController.text,
      //     'equipmentEstimatedValue': equipmentController.text,
      //     'customersDeptBalance': CustomerDebtController.text,
      //     'suppliersDebtBalance': SupplierDebtController.text,
      //   },
      //   "customerId": checkedMember[2].toString(),
      // }

      // LoanValueController,
      // PaymentController,
      // instalmentsController,
      // PurposeController,
    };
    print('api 722');
    try {
      print('3456789');
      print(jsonEncode(body));
      print(jsonEncode(bodyG));
      /////////////////////////////////////////////////////////////////
      print('api ${valStart}');
      final url = Global.url + 'api/LoanRequests/SelfCreate';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: Global.GIGLoan == 'Group Loan'
            ? jsonEncode(bodyG)
            : jsonEncode(body),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        erl = ErrorRResult.fromJson(json.decode(response.body));
        print('22  ${erl.hasErrors}');
        if (erl.hasErrors == true) {
          Get.back();
          Get.snackbar(
              'Error'.tr,
              'personal information has not been entered\n please enter and try again'
                  .tr,
              duration: Duration(seconds: 8),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));
        } else {
          showDialog(
              context: context,
              builder: (_) {
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.of(context).pop(true);
                });
                return Dialog(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Image.asset(
                            'assets/images/LoanRsuc.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5, top: 70),
                          child: Text(
                            'Loan data was successfully packaged'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5, top: 40, bottom: 40),
                          child: Text(
                            'Your request is pending. Please wait until you get a notice to attach files and fixtures or refuse to apply for the loan'
                                .tr,
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
              }).then((value) => {Get.offNamed('/Operations')});
        }
      } else if (response.statusCode == 405) {
        Get.back();
        Get.snackbar(
            'Error'.tr,
            'personal information has not been entered\n please enter and try again'
                .tr,
            duration: Duration(seconds: 8),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      } else {
        errorlist = json.decode(response.body);
        Get.snackbar(
            errorlist[0]['field'].toString(), errorlist[0]['errors'].toString(),
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
//////////////////////////////////////////////////////////////////////////
      //       print(err);
      //       Get.back();
      //       Get.snackbar('Error'.tr, 'Not a valid email address'.tr,
      //           duration: Duration(seconds: 6),
      //           backgroundColor: Color(0XFFFFDDDA),
      //           icon: Icon(
      //             Icons.error_sharp,
      //             color: Color(0xff8e0016),
      //           ));
      //     } else {
      //       logUserModel = logInUserModel.fromJson(json.decode(response.body));
      //       log = logUserModel.successed;
      //
      //       if (response.statusCode == 200 && log == true) {
      //         Global.Gtoken = logUserModel.token;
      //         Get.back();
      //         Get.toNamed("/otp");
      //         emailTextController.clear();
      //         passwordTextController.clear();
      //       } else if (response.statusCode == 200 && log == false) {
      //         Get.back();
      //         Get.snackbar('Error'.tr, logUserModel.errors.toString().tr,
      //             duration: Duration(seconds: 6),
      //             backgroundColor: Color(0XFFFFDDDA),
      //             icon: Icon(
      //               Icons.error_sharp,
      //               color: Color(0xff8e0016),
      //             ));
      //       }
      //     }
    } catch (e) {
      print('ww ${e.toString()}');
      //  Get.back();
      Get.snackbar('Error'.tr, e,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  Future apiGetIndex(String url, List mod, Function fun) async {
    final url1 = Global.url + url;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url1), headers: header);

      //  print(response.statusCode);
      // print(response.body);
      mod = fun(response.body);
      if (response.statusCode == 200) {
        print(mod);
        //isLoading = false;
        //  if (mod.length != 0)
        return mod;
        //  else
        //  return 1;
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  // Future apiGetVillages() async {
  //   print('api get all M is called');
  //   try {
  //     final http.Response response =
  //         await http.get(Global.url + 'api/Villages/IndexGet');
  //
  //     print(response.statusCode);
  //     print(response.body);
  //     Villagesmod = LoanOfficerModelFromJson(response.body);
  //     if (response.statusCode == 200) {
  //       print(Villagesmod);
  //       //isLoading = false;
  //
  //       return Villagesmod;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  Future apiGroupHead() async {
    print('api  get head');
    final url = Global.url + 'api/Customers/GetCustomerGroupHead';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        headM = headModel.fromJson(json.decode(response.body));
        print('22  ${headM.hasErrors}');
        if (headM.hasErrors == true) {
          return headva;
          // return Text('title', //"fill  the personal information",
          //     style: TextStyle(fontSize: 18, color: Colors.white));
          // Get.snackbar('Error'.tr, 'please enter and try again'.tr,
          //     duration: Duration(seconds: 8),
          //     backgroundColor: Color(0xc3cff6fa),
          //     icon: Icon(
          //       Icons.error_sharp,
          //       color: Color(0xff8e0016),
          //     ));
        } else {
          print('22  ${headM.result.name}');

          return headM.result.name;
          //  headval = headM.result.name;
          // Get.snackbar(headM.result.name, 'please enter and try again'.tr,
          //     duration: Duration(seconds: 8),
          //     backgroundColor: Color(0xc3cff6fa),
          //     icon: Icon(
          //       Icons.error_sharp,
          //       color: Color(0xff8e0016),
          //     ));
        }
        // else {
        //
        // }
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error'.tr, e.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  Future apiUnauthorized() async {
    print('api called');
    final url = Global.url + 'api/Customers/UnAuthorizeGroupHead';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);
      print(response.body);
      //   LoanOfficermod = LoanOfficerModelFromJson(response.body);
      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar('Done'.tr, ' ',
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
        //
        //   return LoanOfficermod;
      }
      await apiGroupHead();
    } catch (e) {
      print(e);
    }
  }

  Future AuthorizedGroupHead() async {
    print('api g called');
    final url = Global.url +
        'api/Customers/AuthorizeGroupHead/{${N_NumberTextController.text}}';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      print(response.statusCode);
      print(response.body);
      //  LoanOfficermod = LoanOfficerModelFromJson(response.body);
      if (response.statusCode == 200) {
        // if()
        Get.back();
        //   return LoanOfficermod;
      }
    } catch (e) {
      print(e);
    }
  }

  Future apiGetLoanOfficer() async {
    print('api get all M is called');
    final url = Global.url + 'api/LoanRequests/GetLoanOfficers';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);
      print(response.body);
      LoanOfficermod = LoanOfficerModelFromJson(response.body);
      if (response.statusCode == 200) {
        //  print(LoanOfficermod);
        //isLoading = false;

        return LoanOfficermod;
      }
    } catch (e) {
      print(e);
    }
  }

  // aa() {
  //   // for (var i = 0; i <= checkedMember.length; i++) {
  //   //   print('qqqqqqqqqq');
  //   //   nn(i) {
  //   //     return Text('Group_M$i');
  //   //   }
  //   //   // GroupLoanModel nn(i);
  //   //   // print('qqqqqqqqqq');
  //   //   // G_Loan.add(Group_M$i);
  //   //   // print('qqqqqqqqqq');
  //   //   // print(Group_M$i);
  //   // }
  //
  //   print('Group_M');
  //   print(G_Loan);
  // }

// void onClose() {

//   super.onClose();
// }
  mm(int i) {
    //   groupLoanModel.
    loanInfo.amount = double.parse(instalmentsController.text) *
        double.parse(PaymentController.text);
    loanInfo.possiblePaymentAmount = PaymentController.text;
    loanInfo.installmentsCount = instalmentsController.text;
    loanInfo.loanReason = PurposeController.text;
    loanInfo.institutionIdentificationWayId = valInstitutionIW;

    projectInfo.projectName = projectNameController.text;
    projectInfo.projectOwner = projectOwnerController.text;
    projectInfo.projectAddress = WorkAddressController.text;
    projectInfo.phone = phoneProjectController.text;
    projectInfo.propertyOwner = projectOwnerController.text;
    projectInfo.experienceYears = ExperienceYearsController.text;
    projectInfo.projectStateId = valProjectStates;
    projectInfo.projectResidentRent = RentalController.text;
    projectInfo.contractStartDate = valStart;
    projectInfo.contractEndDate = valEnd;
    projectInfo.monthlySales = MonthlySTextController.text;
    projectInfo.permanentWorkers = PermanentEmployeesController.text;
    projectInfo.temporalWorkers = TemporaryEmployeesController.text;
    projectInfo.fule = fuelController.text;
    projectInfo.maintenance = maintenanceController.text;
    projectInfo.workersSalaries = SalariesOfEmployeesController.text;
    projectInfo.goodsEstimatedValue = goodsController.text;
    projectInfo.equipmentEstimatedValue = equipmentController.text;
    projectInfo.customersDeptBalance = CustomerDebtController.text;
    projectInfo.suppliersDebtBalance = SupplierDebtController.text;

    groupLoanModel.loanInfo = loanInfo;
    groupLoanModel.projectInfo = projectInfo;
    groupLoanModel.customerId = checkedMember[i].toString();

    // ll = loanInfo;
    // pl = projectInfo;
    // gl = groupLoanModel;
    // cc = Loanv;
    //
    // ct = valLoanOfficer;
    // cv = jsonEncode(cc);
    // cx = jsonEncode(ct);
    ll = jsonEncode(loanInfo.toJson());
    pl = jsonEncode(projectInfo.toJson());
    if (groupLoanModel != null) gl = jsonEncode(groupLoanModel.toJson());
  }

  financialInfo() async {
    C_List = await api();
    (C_List.jobType != null && C_List.jobType != '')
        ? Global.checkF_info = true
        : Global.checkF_info = false;
  }

  @override
  void dispose() {
    //  C_List == null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
