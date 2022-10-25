class LogintData{
  late int code;
  late int status;
  late String message;

  LogintData(this.code,this.status,this.message);

  LogintData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "message": message,
  };

}