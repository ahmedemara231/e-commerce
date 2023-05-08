class ResponseModel
{
  bool status;
  Map<String, dynamic> data;

  ResponseModel({
    required this.status,
    required this.data,
  });
  factory ResponseModel.fromJson(Map<String, dynamic> jsonData)
  {
    return ResponseModel(
      status: jsonData['status'],
      data: jsonData['data'],
    );
  }

}
