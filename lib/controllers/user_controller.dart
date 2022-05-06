
import 'package:estados/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userExists = false.obs;
  var user = User().obs;

  int get getProfessionsCount{
    return user.value.professions.length;
  }

  void loadUser(User user){
    this.user.value = user;
    userExists.value = true;
  }

  void clearUser(){
    this.userExists.value = false;
  }

  void changeAge(int age){
    if (!userExists.value) return;
    user.update((val) {
      val?.age = age;
    });
  }

  void addProfession(){
    if (!userExists.value) return;
    user.update((val) {
      var prof = val!.professions;
      val!.professions = [ ...prof, 'Profession ${prof.length}' ];
    });
  }

}