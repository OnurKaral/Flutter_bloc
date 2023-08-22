import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:studio_flutter/constants.dart';
import 'package:studio_flutter/data/model/Player.dart';

part 'get_player_event.dart';
part 'get_player_state.dart';

class GetPlayerBloc extends Bloc<GetPlayerEvent, GetPlayerState> {
  GetPlayerBloc(int playerId) : super(GetPlayerInitial()) {
    on<OnGetPlayerEvent>((event, emit) async {
      emit(GetPlayerLoading());

      final dio = Dio();

      dio.interceptors.add(PrettyDioLogger());

      final response = await dio.get(
        "${Constants.BASE_URL}players/$playerId",
      );

      Player player = Player.fromJson(response.data);

      if (response.statusCode == 200) {
        emit(GetPlayerSuccess(player));
      } else {
        emit(const GetPlayerFail('Bir hata oluştu'));
      }
    });
  }
}
