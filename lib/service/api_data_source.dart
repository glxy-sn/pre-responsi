// import 'base_network.dart';
//
// class ApiDataSource{
//   static ApiDataSource instance = ApiDataSource();
//
//   Future<List <dynamic>> loadWeapon(){
//     return BaseNetwork.getList("weapons");
//   }
//   Future<Map <String, dynamic>> loadIconWeapon(String iconImg){
//     String name = iconImg.toString();
//     return BaseNetwork.get("weapons/$name/icon");
//   }
//   // Future<Map<String, dynamic>> loadDetailUser(int idDiterima){
//   //   String id = idDiterima.toString();
//   //   return BaseNetwork.get("users/$id");
//   // }
// }