class HomeModel
{
  bool status;
   Map<String, dynamic> data;
  //Data? data;
  HomeModel({
    required this.status,
    required this.data,
});
   factory HomeModel.fromJson(Map<String, dynamic> jsonData)
   {
     return HomeModel(
         status: jsonData['status'],
         // data: jsonData == null? null : Data.fromJson(jsonData),
         data: jsonData['data']
     );
   }
}

