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
  late final String name;
  late final String email;
  final String image;
  late final String phoneNumber;
}
