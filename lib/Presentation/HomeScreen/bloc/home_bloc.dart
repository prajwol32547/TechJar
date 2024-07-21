import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecapp/Presentation/HomeScreen/Model/ListModel.dart';
import 'package:tecapp/Repository/fetchingData.dart';
import 'package:tecapp/utils/cache_helper.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitalEvent>(_onInitialize);
  }

  _onInitialize(HomeInitalEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      List<ListModel> obj = [];
      obj = await CacheHelper.LoadDataFromListCache() ?? [];
      if (obj.isEmpty) {
        obj = await getAllList();
        CacheHelper.CacheListData(obj);
      }

      print(obj);
      emit(state.copyWith(isLoading: false, ListModelObj: obj));
    } catch (e) {
      print(e);
    }
  }
}
