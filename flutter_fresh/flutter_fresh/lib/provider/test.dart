import 'package:flutter_fresh/data/api_service.dart';
import 'package:flutter_fresh/data/user_data.dart';
import 'package:flutter_fresh/equatable/user.dart';
import 'package:flutter_fresh/model/user_model.dart';
import 'package:flutter_fresh/provider/user_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider.family<String, String>((ref, name) {
  return "Hello $name";
});

final infoProvider = Provider.family<String, User>((ref, user) {
  return "Hello ${user.name} ${user.address}";
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});

final countNotifyProvider = StateNotifierProvider.autoDispose<CountNotifier, int>((ref) {
  return CountNotifier();
});


class CountNotifier extends StateNotifier<int> {
  CountNotifier(): super(0);
  

  void add () {
    state += 1;
  }
}

final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiProvider).getUser();
});

final themeProvider = StateProvider<bool>((ref) {
  return true;
});

final userProvider = StateNotifierProvider<UserNotifier, UserData>((ref) {
  return UserNotifier(const UserData(name: "Prince", address: "New York")) ;
});


// Another way of using notifier

class CountingNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

final countingNotifierProvider = NotifierProvider<CountingNotifier, int>(() {
  return CountingNotifier();
});