import 'package:flutter/material.dart';
import 'package:flutter_practice/user.profile.model.dart';
import 'package:get/get.dart';
import 'constant.dart';
import 'profile.controller.dart';

// ignore: must_be_immutable
class ProfileDetails extends StatelessWidget {
  ProfileDetails({required this.index, Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());
  final int index;

  @override
  Widget build(BuildContext context) {
    var person = profileController.profileContent[index];
    UserProfile singlePerson;
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
                builder: (_) => TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Edit',
                      content: Column(
                        children: [
                          TextField(
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            
                            onChanged: (value) {
                              person.name = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: person.name,
                              icon: const Icon(Icons.person),
                            ),
                          ),
                          TextField(
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: person.phoneNumber,
                              icon: const Icon(Icons.email),
                            ),
                            onChanged: (value) {
                              person.email = value;
                            },
                          ),
                          TextField(
                            textInputAction: TextInputAction.go,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: person.phoneNumber,
                              icon: const Icon(Icons.phone),
                            ),
                            onChanged: (value) {
                              person.phoneNumber = value;
                            },
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed:
                          () {
                            Get.back();
                              profileController.profileContent.refresh();
                          },
                          child: const Text('ok'),
                        ),
                      ],
                      barrierDismissible: false,
                    );
                  },
                  child: const Text('Edit'),
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
