extends Node

var player_mode: int

enum PLAY_MODES {
	FARMER,
	SHOOTER
}

const WEAPON_IDS: Dictionary = {
	"shovel_gun" : "Farm-01",
	"water_gun": "Farm-02"
}

const PROJECTILE_IDS: Dictionary = {
	"water_bullet" : "Proj-01",
	"player_damage_bullet": "Proj-02",
	"enemy_damage_bullet": "Proj-03",
}


func toggle_player_mode() -> void:
	if player_mode == PLAY_MODES.FARMER:
		player_mode = PLAY_MODES.SHOOTER
		return
	else:
		player_mode = PLAY_MODES.FARMER
