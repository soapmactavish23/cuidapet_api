// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cuidapet_api/application/helpers/request_mapping.dart';

class UserSaveInputModel extends RequestMapping {
  late String email;
  late String password;
  int? supplierId;

  UserSaveInputModel(super.dataRequest);

  @override
  void map() {
    email = data['email'];
    password = data['password'];
  }
}
