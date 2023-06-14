import 'package:get/get.dart';
import 'package:graduation_project/models/parent_model.dart';
import 'package:graduation_project/services/auth_repo.dart';

import '../models/respose_model.dart';

class AuthController extends GetxController{
  var isStudent = false;
  var isClicked = false;
  final AuthRepo authRepo;
  bool isLoading = false;

  AuthController({required this.authRepo});

  void changeLoginRoles() {
     isStudent=!isStudent;
     update();
  }
   void showStudentLoginWidget() {
     isStudent = true;
     isClicked= true ;
     update();
  }
  void showParentLoginWidget(){
     isClicked = true;
     isStudent = false;
     update();
  }

  Future<ResponseModel> registration(ParentModel parentModel) async {
    isLoading = true;
    //value is edited
    update();
    //to control the request and send it to UI
    Response response = await authRepo.registration(parentModel);
    // print(response.toString());
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      //to receive post response correctly
      responseModel = ResponseModel(true, response.body['token']);
      // print(response.body['token'].toString());
    } else {
      responseModel = ResponseModel(false, response.statusText!);
      print(responseModel.message);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String password, String email) async {
    // print('getting token');
    // print(jsonEncode(authRepo.getUserToken().toString()));//to get user token firstly
    isLoading = true;
    update();

    Response response = await authRepo.login(password,email);
    // print(response.body.toString());
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      print('backend token');
      authRepo.saveUserToken(response.body['token']);
      //to receive post response correctly
      // print(response.body['token'].toString());
      responseModel = ResponseModel(true, response.body['token']);

    } else {
      responseModel = ResponseModel(false, response.statusText!);
      print(responseModel.message);
    }
    isLoading = false;
    update();
    return responseModel;
  }
  void saveUserEmailAndPassword(String email,String password) {
    authRepo.saveUserEmailAndPassword(email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  bool clearSharedData(){
    return authRepo.removeSharedData();
  }

}