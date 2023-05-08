class CategoryModel
{
  bool status;
  Map<String, dynamic> data;

  CategoryModel({
    required this.status,
    required this.data,
});
  factory CategoryModel.fromJson(Map<String, dynamic> jsonData)
  {
    return CategoryModel(
        status: jsonData['status'],
        data: jsonData['data'],
    );
  }

}