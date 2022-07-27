extends Node

var player_mode: int

enum PLAY_MODES {
	FARMER,
	SHOOTER
}

func toggle_player_mode() -> void:
	print('togle')
	if player_mode == PLAY_MODES.FARMER:
		player_mode = PLAY_MODES.SHOOTER
		return
	else:
		player_mode = PLAY_MODES.FARMER
