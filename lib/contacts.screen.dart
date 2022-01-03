import 'package:flutter/material.dart';
import 'package:flutter_practice/profile.controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'profile.controller.dart';
import 'profile.details.dart';

class ContactsScreen extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  int lastIndex = 0;

  ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Gmail Contacts'),
          ),
          body: GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (_) => ListView.builder(
              itemCount: profileController.profileContent.length,
              itemBuilder: (BuildContext context, int index) {
                var person = profileController.profileContent[index];
                lastIndex = index;
                return Card(
                  child: TextButton(
                    onPressed: () {
                      Get.to(ProfileDetails(
                        index: index,
                      ),);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(person.image),
                      ),
                      title: Text(person.name),
                      subtitle: Text(person.email),
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: DialogBox(
            person: profileController.profileContent[6], 
            profileController: profileController, 
            onPressed: () {
              profileController.editProfile(profileController.profileContent[6]);
              Get.back();
              profileController.refresh();
            },
          ),
        ),
      ),
    );
  }
}
