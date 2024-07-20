part of 'detail_bloc.dart';

class DetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, requestSend, commentModelObj];
  bool? isLoading;
  bool? requestSend;
  List<commentModel>? commentModelObj;

  DetailState(
      {this.isLoading = false,
      this.requestSend = false,
      this.commentModelObj = const []});

  DetailState copyWith({
    bool? isLoading,
    bool? requestSend,
    List<commentModel>? commentModelObj,
  }) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
      requestSend: requestSend ?? this.requestSend,
      commentModelObj: commentModelObj ?? this.commentModelObj,
    );
  }
}
