import 'package:flutter/material.dart';
import 'package:flutter_practice/user.profile.model.dart';
import 'package:get/get.dart';
import 'constant.dart';
import 'profile.controller.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails({required this.index, Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());
  final int index;

  @override
  Widget build(BuildContext context) {
    var person = profileController.profileContent[index];
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
            actions: [
              GetBuilder<ProfileController>(
                init: ProfileController(),
                builder: (_) => DialogBox(
                  person: person, 
                  name: person.name,
                  email: person.email,
                  phoneNumber: person.phoneNumber,
                  profileController: profileController, 
                  onPressed: () {
                    Get.back();
                    profileController.refresh();
                  },
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(person.image),
                        radius: 80.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        person.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              Section(
                titleDtails: person.id.toString(),
                title: 'ID:',
              ),
              Section(
                titleDtails: person.email,
                title: 'Email:',
              ),
              Section(
                titleDtails: person.phoneNumber,
                title: 'Phone:',
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

class DialogBox extends StatelessWidget {
  DialogBox({
    Key? key,
    required this.person,
    required this.profileController,
    required this.onPressed,
    required this.name,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  final UserProfile person;
  final ProfileController profileController;
  final VoidCallback? onPressed;
  String name;
  String email;
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.defaultDialog(
          title: 'Edit',
          content: Column(
            children: [
              InputSection(
                onChanged: (value) {
                  // person.name = value;
                  name = value;
                },
                inputText: name,
                icon: Icons.person,
                
              ),
              InputSection(
                onChanged: (value) {
                  // person.email = value;
                  email = value;
                },
                inputText: email,
                icon: Icons.email,
              ),
              InputSection(
                onChanged: (value) {
                  // person.phoneNumber = value;
                  phoneNumber = value;
                },
                inputText: phoneNumber,
                icon: Icons.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              // () {
                // Get.back();
                // profileController.refresh();
              // },
              child: const Text('ok'),
            ),
          ],
          barrierDismissible: false,
        );
      },
      child: const Text('Edit'),
    );
  }
}

class InputSection extends StatelessWidget {
  const InputSection({Key? key, required this.onChanged, required this.inputText, required this.icon}) : super(key: key);

  // final UserProfile person;
  final String inputText;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.text,
      textAlign: TextAlign.center,
      decoration: kTextFieldDecoration.copyWith(
        hintText: inputText,
        icon: Icon(icon),
      ),
      onChanged: onChanged,
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
    required this.titleDtails,
  }) : super(key: key);

  final String titleDtails;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          children: [
            SizedBox(
              child: Text(title),
              width: 50.0,
            ),
            Text(titleDtails),
          ],
        ),
      ),
    );
  }
}
