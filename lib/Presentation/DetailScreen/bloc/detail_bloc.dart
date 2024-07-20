import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecapp/Presentation/DetailScreen/Model/commentModel.dart';
import 'package:tecapp/Repository/fetchingData.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(DetailState initialState) : super(initialState) {
    on<DetailInitialEvent>(_onInitialize);
  }

  @override
  _onInitialize(DetailInitialEvent event, Emitter<DetailState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<commentModel> obj = await getAllComments(event.postId!);
      emit(state.copyWith(isLoading: false, commentModelObj: obj));
    } catch (e) {
      print(e);
    }
  }
}
