import 'package:doan_thanh_nien/bloc/state/activity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event/activity_event.dart';

class ActivityDetailBloc extends Bloc<ActivityDetailEvent, ActivityDetailState> {
  ActivityDetailBloc() : super(ActivityDetailInitial()) {
    on<LoadActivityDetail>((event, emit) {
      emit(ActivityDetailLoaded(
        title: event.title,
        imagePath: event.imagePath,
        day: event.day,
        location: event.location,
        registered: event.registered,
      ));
    });
  }
}
