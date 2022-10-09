import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './global/globalVars.dart' as Global;
import 'Complaint/ComplaintController.dart';

class provideri with ChangeNotifier {
  bool pa = true;
  int index = 0;
  final ComplaintController _complaintController =
      Get.put(ComplaintController());

  void chang() {
    pa = !pa;
    notifyListeners();
  }

  void index_val(int i) {
    index = i;
    notifyListeners();
  }

  void c(bool v) {
    v = !v;
    notifyListeners();
  }

  void v(String s) {
    s = _complaintController.compval;
    notifyListeners();
  }

  void dispose() {
    super.dispose();
  }
}
