part of 'detail_bloc.dart';

class DetailEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DetailInitialEvent extends DetailEvent {
  int? postId;
  DetailInitialEvent({required this.postId});
}

class DetailPostEvent extends DetailEvent {
  Map<String, dynamic>? payload;
  DetailPostEvent({required this.payload});
}
