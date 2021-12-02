class RegisterModel{
  String message, sessionC;
  bool status;

  RegisterModel({this.message, this.sessionC, this.status});

  factory RegisterModel.fromjson(Map<String, dynamic> parsed){
    return RegisterModel(
        message: parsed['msg'],
        sessionC: parsed['sesscode'],
        status: parsed['status']
    );
  }
}