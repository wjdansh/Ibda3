
class CustomerLoanModel {
  CustomerLoanModel({
    this.loanProcessId,
    this.requestedAmount,
    this.state,
    this.loanService,
    this.requestDate,

  });
  int loanProcessId;
  double requestedAmount;
  String state;
  String loanService;
  String requestDate;

  factory CustomerLoanModel.fromJson(Map<String, dynamic> json)
  => CustomerLoanModel(
    loanProcessId: json["loanProcessId"] == null ? null : json["loanProcessId"],
    requestedAmount: json["requestedAmount"] == null ? null : json["requestedAmount"],
    state: json["state"] == null ? null : json["state"],
    loanService: json["loanService"] == null ? null : json["loanService"],
    requestDate: json["requestDate"] == null ? null : json["requestDate"],
  );

  Map<String, dynamic> toJson() => {
    "loanProcessId": loanProcessId == null ? null : loanProcessId,
    "requestedAmount": requestedAmount == null ? null : requestedAmount,
    "state": state == null ? null : state,
    "loanService": loanService == null ? null : loanService,
    "requestDate": requestDate == null ? null : requestDate,
  };
}