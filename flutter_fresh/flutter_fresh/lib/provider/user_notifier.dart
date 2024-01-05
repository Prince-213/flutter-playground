import 'package:flutter_fresh/data/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<UserData> {
  UserNotifier(super.state);

  void updateName(String newValue) {
    state = state.copyWith(name: newValue);

    
  }

  void updateAddress(String newValue) {
    state = state.copyWith(address: newValue);
  }
}
