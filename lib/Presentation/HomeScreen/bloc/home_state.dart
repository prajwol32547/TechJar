part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<ListModel>? ListModelObj;
  final bool isLoading;
  final bool isCached;

  HomeState({
    this.ListModelObj,
    this.isLoading = false,
    this.isCached = false,
  });

  @override
  List<Object?> get props => [ListModelObj, isLoading, isCached];

  HomeState copyWith({
    List<ListModel>? ListModelObj,
    bool? isLoading,
    bool? isCached,
  }) {
    return HomeState(
      ListModelObj: ListModelObj ?? this.ListModelObj,
      isLoading: isLoading ?? this.isLoading,
      isCached: isCached ?? this.isCached,
    );
  }
}
