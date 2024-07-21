import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Repository/fetchingData.dart';
import 'package:tecapp/utils/cache_helper.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(DetailState initialState) : super(initialState) {
    on<DetailInitialEvent>(_onInitialize);
    on<DetailPostEvent>(_OnPostDetail);
  }

  @override
  _onInitialize(DetailInitialEvent event, Emitter<DetailState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<commentModel> obj = [];
      obj =
          await CacheHelper.LoadDataFromCommentCache(event.postId.toString()) ??
              [];
      if (obj.isEmpty) {
        print('postid is ${event.postId}');
        obj = await getAllComments(event.postId!);
        CacheHelper.CacheCommentData(event.postId!, obj);
      }
      emit(state.copyWith(isLoading: false, commentModelObj: obj));
    } catch (e) {
      print(e);
    }
  }

  _OnPostDetail(DetailPostEvent event, Emitter<DetailState> emit) async {
    emit(state.copyWith(requestSend: true));
    try {
      Map<String, dynamic> data = event.payload!;
      var request = await postComments(event.postId!, data);
      print('request is ${request}');
      if (request != null) {
        emit(state.copyWith(requestSend: false));
      }
    } catch (e) {
      print('error hapened ${e}');
      emit(state.copyWith(
          requestSend: false, commentSentMessage: 'Error occured'));
    }
  }
}
