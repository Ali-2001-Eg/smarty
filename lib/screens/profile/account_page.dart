import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/user_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final UserController _controller = Get.put(UserController());
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff090A4A),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white70,
            )),
        backgroundColor: const Color(0xff090A4A),
        title: Text('Update Profile',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white70)),
        centerTitle: true,
        bottomOpacity: 0,
        actions: const [
          // IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/images/logo.png'),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/spalshLearn.png')),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //username
              _immutableProfileWidget(
                  context, Icons.person, 'Ali_Eg', 'username'),
              //email
              _immutableProfileWidget(context, Icons.email,
                  'alimazenali@outlook.com', 'email address'),
              //confirm current password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 0),
                    padding: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'Current Password',
                      style: TextStyle(
                        color: Color(0xffFEA633),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(20)),
                    child: Obx(
                      () => TextFormField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                        key: _key,
                        enabled: !_controller.isDisabled.value,
                        controller: _currentPasswordController,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white70),
                        obscureText: (_controller.isPasswordShown.value),
                        decoration: InputDecoration(
                          hintText: 'Type Your Current Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _controller.suffix,
                              size: 35,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              print('tapped');
                              _controller.changeSuffixIcon();
                            },
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.lock,
                              size: 35,
                              color: Colors.white70,
                            ),
                            onPressed: () {},
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.white70,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
               
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    // print('ali');
                    _controller.disableTextField();
                    _controller.verifyCurrentPassword();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                //new password
              ),
              const SizedBox(
                height: 10,
              ),
              //new password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 0),
                    padding: const EdgeInsets.only(left: 25),
                    child: const Text(
                      'New Password',
                      style: TextStyle(
                        color: Color(0xffFEA633),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(20)),
                    child: Obx(
                      () => TextField(
                        enabled: _controller.isVerified.value,
                        controller: _newPasswordController,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white70),
                        obscureText: (_controller.isPasswordShown.value),
                        decoration: InputDecoration(
                          hintText: 'Type new Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _controller.suffix,
                              size: 35,
                              color: Colors.white70,
                            ),
                            onPressed: () {
                              print('tapped');
                              _controller.changeSuffixIcon();
                            },
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.lock,
                              size: 35,
                              color: Colors.white70,
                            ),
                            onPressed: () {},
                          ),
                          hintStyle:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.white70,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),color: Colors.blue,
                      ),
                      margin: const EdgeInsets.only(top: 20),

                      child: TextButton(
                        onPressed: () {
                          // print('ali');
                          _controller.verifyCurrentPassword();
                        },
                        child: const Text(
                          'Save Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //new password
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _immutableProfileWidget(
    BuildContext context,
    IconData icon,
    String text,
    String label,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 5),
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              label,
              style: const TextStyle(
                color: const Color(0xffFEA633),
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white70),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(top: 0, left: 15, right: 15),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white70,
                  size: 45,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  text,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white70),
                )),
              ],
            ),
          ),
        ],
      );
}
