import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_19_12/core/services/api_services.dart';
import 'package:insights_news_19_12/features/news/cubit/news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  getNewsByCategory(String category) {
    emit(NewsLoadingState());
    try {
      ApiServices().getNewsByCategory(category).then((value) {
        emit(NewsSucessState(model: value!));
      });
    } catch (e) {
      emit(NewsErrorState(error: e.toString()));
    }
  }

  getNewsBySearch(String searchKey) {
    emit(NewsSearchLoadingState());
    try {
      ApiServices().getNewsBySearch(searchKey).then((value) {
        emit(NewsSearchSucessState(model: value!));
      });
    } catch (e) {
      emit(NewsSearchErrorState(error: e.toString()));
    }
  }
}
