import 'package:get/get.dart';
import 'package:ibda3/Forgetpassword/forgetpasswordview.dart';
import 'package:ibda3/Guides/About.dart';
import 'package:ibda3/Guides/LendingGuideView.dart';
import 'package:ibda3/Guides/SavingGuide.dart';
import 'package:ibda3/Loanrequest/FinancialStatements.dart';
import 'package:ibda3/Loanrequest/GroupLoan.dart';
import 'package:ibda3/Loanrequest/LoanStatements.dart';
import 'package:ibda3/Loanrequest/loanrequest.dart';
import 'package:ibda3/Login/login_View.dart';
import 'package:ibda3/MainPage/MainPage.dart';
import 'package:ibda3/Map/map.dart';
import 'package:ibda3/Message/MessageView.dart';
import 'package:ibda3/OTP/otpView.dart';
import 'package:ibda3/Operations/Operations.dart';
import 'package:ibda3/Payment/Services.dart';
import 'package:ibda3/Payment/payment.dart';
import 'package:ibda3/QRcode/QRcode.dart';
import 'package:ibda3/QRcode/QrInfo.dart';
import 'package:ibda3/firstTime/firstTime.dart';
import 'package:ibda3/questions/questionsview.dart';
import 'package:ibda3/resetpassword/resetpasswordview.dart';

import '../Complaint/ComplaintView.dart';
import '../Operations/parts.dart';
import '../Payment/bills.dart';
import '../Products/Products.dart';
import '../PurchaseLoan/PurchaseLoan.dart';
import '../api_MyLoans/MyLoans.dart';
import '../splash.dart';

class viewsRouter {
  static final route = [
    GetPage(
      name: '/SplashScreen',
      page: () => SplashScreen1(),
    ),
    GetPage(
      name: '/login',
      page: () => Login_view(),
    ),
    GetPage(
      name: '/otp',
      page: () => otpview(),
    ),
    GetPage(
      name: '/restpass',
      page: () => resetpasswordview(),
    ),
    GetPage(
      name: '/forgetpass',
      page: () => forgetpasswordview(),
    ),
    GetPage(
      name: '/Questions',
      page: () => questionsview(),
    ),
    GetPage(
      name: '/mainpage',
      page: () => MainPage(),
    ),
    GetPage(
      name: '/Operations',
      page: () => Operations(),
    ),
    GetPage(
      name: '/loanrequest',
      page: () => loanrequest(),
    ),
    GetPage(
      name: '/financialStatements',
      page: () => FinancialStatements(),
    ),
    GetPage(
      name: '/firstTime',
      page: () => firstTime(),
    ),
    GetPage(
      name: '/LendingGuide',
      page: () => LendingGuideView(),
    ),
    GetPage(
      name: '/SavingGuide',
      page: () => savingGuideView(),
    ),
    GetPage(
      name: '/About',
      page: () => aboutview(),
    ),
    GetPage(
      name: '/LoanStatements',
      page: () => LoanStatements(),
    ),
    GetPage(
      name: '/GroupLoan',
      page: () => GroupLoan(),
    ),

    // GetPage(
    //   name: '/map',
    //   page: () => map(),
    // ),
    GetPage(
      name: '/Products',
      page: () => subProducts(),
    ),
    GetPage(
      name: '/complaint',
      page: () => complaint(),
    ),
    GetPage(
      name: '/MyLoans',
      page: () => MyLoans(),
    ),
    GetPage(
      name: '/Message',
      page: () => MessageView(),
    ),
    GetPage(
      name: '/Payment',
      page: () => Payment(),
    ),
    GetPage(
      name: '/Services',
      page: () => Services(),
    ),
    GetPage(
      name: '/QRcode',
      page: () => QRCode(),
    ),
    GetPage(
      name: '/qrInfo',
      page: () => qrInfo(),
    ),
    GetPage(
      name: '/purchaseLoan',
      page: () => purchaseLoan(),
    ),
    GetPage(
      name: '/bills',
      page: () => MyBills(),
    ),
  ];
}
