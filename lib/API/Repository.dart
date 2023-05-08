import 'package:dio/dio.dart';
import 'package:shop_app/API/models/Category%20Products.dart';
import 'package:shop_app/API/models/Home_model.dart';
import 'package:shop_app/API/models/Login_model.dart';
import 'package:shop_app/API/services.dart';
import 'package:shop_app/view/pageView_model.dart';

class Repo
{
  Services services = Services();

  Future<ResponseModel> postData({
  required String email,
    required String password
})async
  {
   Response response = await services.postData(
       path: 'login',
       data:
    {
      'email' : email,
      'password' : password
    });
   return ResponseModel.fromJson(response.data);
  }
  
  Future<ResponseModel> register({
  required String name,
  required String email,
  required String password,
  required String phone,
})async
  {
    Response response = await services.postData(
      path: 'register',
      data:
      {
        'name' : name,
        'email' : email,
        'password' : password,
        'phone' : phone
      },
    );
    return ResponseModel.fromJson(response.data);
}

  Future<ResponseModel> updateInfo({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String token
})async
  {
    Response response = await services.putData(
        token: token,
        path: 'update-profile',
        data:
        {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone
        }
    );
    return ResponseModel.fromJson(response.data);
  }
  
  void logOut() async
  {
    Response response = await services.postData(path: 'logout', data: {});
  }

  Future<CategoryModel> getCategoryProducts()async
  {
    Response response = await services.getData(
      'products',
      queryParams:
        {
          'category_id' : '1'
        },
    );
    return CategoryModel.fromJson(response.data);
  }

  Future<HomeModel> getHomeData() async
  {
   Response response = await services.getData(
       'home',
     lang: 'en'
   );
   return HomeModel.fromJson(response.data);
  }


  Future<HomeModel> getCategory() async
  {
    Response response = await services.getData('categories',lang: 'en');
    return HomeModel.fromJson(response.data);
  }

}
