import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit()
      : super(
          HomeScreenState(
            items: List<String>.empty(growable: true),
            isScrollable: false,
          ),
        );

  void addItem(String item) {
    final currentItems = List<String>.from(state.items);
    currentItems.add(item);
    emit(state.copyWith(items: currentItems));
  }

  void removeItem() {
    final currentItems = List<String>.from(state.items);
    if (currentItems.isNotEmpty) {
      currentItems.removeLast();
      emit(state.copyWith(items: currentItems));
    }
  }

  void checkScrolablility(bool isScrolalbleNew) {
    if (state.isScrollable != isScrolalbleNew) {
      emit(state.copyWith(isScrollable: isScrolalbleNew));
    }
  }
}
