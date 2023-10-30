part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final List<String> items;
  final bool isScrollable;

  const HomeScreenState({
    required this.items,
    required this.isScrollable,
  });

  HomeScreenState copyWith({
    List<String>? items,
    bool? isScrollable,
  }) =>
      HomeScreenState(
          items: items ?? this.items,
          isScrollable: isScrollable ?? this.isScrollable);

  @override
  List<Object?> get props => [items, isScrollable];
}
