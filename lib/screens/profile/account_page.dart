import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/controllers/user_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key}) : super(key: key);

  final UserController _controller = Get.put(UserController());
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090A4A),
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
              _editableProfileWidget(context, 'Current Password',
                  'Type Your Current Password', _currentPasswordController,false),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: (() {
                  _controller.verifyCurrentPassword();
                }),
                icon: const Icon(Icons.check_box),
                label: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(15),
                  child: const Text(
                    'submit',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),

              //new password
             _editableProfileWidget(context, 'New Password',
                  'Type a New Password', _newPasswordController,true),
              const SizedBox(
                height: 50,
              ),
              TextButton.icon(
                onPressed: (() {}),
                icon: const Icon(Icons.save_alt_outlined),
                label: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    'save new password',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
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

  Widget _editableProfileWidget(BuildContext context, String label, String hint,
          TextEditingController txtController,bool isNew,) {
    print(isNew);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 0),
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              label,
              style: const TextStyle(
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
            child: Obx(() => TextField(
                  enabled: isNew?_controller.isVerified.value:true,
                  controller: txtController,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white70),
                  obscureText: (_controller.isPasswordShown.value),
                  decoration: InputDecoration(
                    hintText: hint,
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
                    hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ),
            ),
          ),
        ],
      );
  }
}
