import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studio_flutter/constants.dart';
import 'package:studio_flutter/data/model/AllPlayersResponse.dart';

part 'get_all_players_event.dart';
part 'get_all_players_state.dart';

class GetAllPlayerBloc extends Bloc<GetAllPlayerEvent, GetAllPlayersState> {
  GetAllPlayerBloc() : super(GetAllPlayersInitial()) {
    on<OnGetAllPlayerEvent>((event, emit) async {
      emit(GetAllPlayersLoading());

      final dio = Dio();

      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));

      final response = await dio.get(
        "${Constants.BASE_URL}players",
      );

      AllPlayersResponse allPlayers =
          AllPlayersResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        emit(GetAllPlayersSuccess(allPlayers));
      } else {
        emit(const GetAllPlayersFail('Bir hata oluştu'));
      }
    });
  }
}
