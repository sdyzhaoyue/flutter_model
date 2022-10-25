class BaseEntity<E> {
  late String code;
  late int status;
  late String message;
  late String cmd;
  late String result;
  late String reason;
  late E data;
  void fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    cmd = json['cmd'];
    result = json['result'];
    reason = json['reason'];
    data = json['data'];
  }
}