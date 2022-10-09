import 'package:get/get.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibda3/api_MyLoans/models/getCustomerModel.dart';

class gCLController extends GetxController {
  bool noloans = true;

  List<CustomerLoanModel> resultList;
  List<CustomerLoanModel> nn;
  @override
  void onInit() async {
    nn = await getCustomerLoans();
    super.onInit();
    update();
  }

  Future getCustomerLoans() async {
    final url = 'http://185.194.124.200:8031/api/LoanProcess/GetCustomerLoans';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    var response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    print("api get my loans called");
    if (response.statusCode == 200) {
      // print(response.body.length);
      // print(response.body);

      if (response.body.length == 2) {
        noloans = false;
        print("No  loans");
      } else {
        var decoded = CustomerLoanModelFromJson(response.body);
        print('222 ${decoded}');
        resultList = [];
        // res.addAll(decoded);
        resultList.addAll(decoded);
        return resultList;
      }
    } else
      throw Exception('Error');
  }
}

List<CustomerLoanModel> CustomerLoanModelFromJson(String str) =>
    List<CustomerLoanModel>.from(
        json.decode(str).map((x) => CustomerLoanModel.fromJson(x)));

String CustomerLoanModelToJson(List<CustomerLoanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
