import 'package:get/state_manager.dart';

class UserProfile extends GetxController {
  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.phoneNumber,
  });
  final int id;
   String name;
   String email;
   String image;
   String phoneNumber;
}
