extends Node2D


onready var p_Projectile: PackedScene = preload("res://game/projectile/Projectile.tscn")

onready var hud: CanvasLayer = get_node("HUD")

onready var time_manager: TimeManager = get_node("TimeManager")
onready var garden_manager: GardenManager = get_node("GardenManager")
onready var bullet_manager = get_node("BulletManager")

onready var player: Player = get_node("Player")

const dawn_color: Color = Color("141d35")
const night_color: Color = Color("000000")
const evening_color: Color = Color("341818")
const day_color: Color = Color.white


func _ready() -> void:
	self.player.connect("on_play_mode_toggle", self, "_toggle_mode_icon")
	self.player.connect("on_weapon_fired_pressed", self, "_add_bullet_to_screen")
	#####self.player.connect("request_plot_placement", self.garden_manager, "place_plot")
	self.player.connect("request_plot_placement", self, "_check_tile")
	self.player.connect("started_reloading", self, "_player_reloading")	
	self.player.connect("done_reloading", self, "_player_done_reloading")
	self.time_manager.connect("_on_the_minunte", self.hud, "update_time")

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _add_bullet_to_screen(current_weapon: Weapon) -> void:
	print('MADE IT TO GAME SCRIPT')
	var bullet = p_Projectile.instance()
	bullet.global_transform = current_weapon.muzzle.global_transform
	bullet_manager.add_child(bullet)
	bullet.set_projectile_properties(current_weapon)

func _toggle_mode_icon():
	hud.toggle_icon()

func _change_sky_color(start: Color, end: Color) -> void:
	$CanvasModulate/Tween.interpolate_property($CanvasModulate, "color", start, end, 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$CanvasModulate/Tween.start()

func _player_reloading() -> void:
	hud.show_reload_icon()

func _player_done_reloading() -> void:
	hud.hide_reload_icon()

func _check_tile(pos: Vector2) -> void:
	var tile_cordinates = $TileMap3.world_to_map(pos)
	var tile_ID = $TileMap3.get_cellv(tile_cordinates)
	var sprite_placement =  $TileMap3.map_to_world(tile_cordinates)
	
	match tile_ID:
		0: 
			print("grass")
			self.garden_manager.place_plot(sprite_placement.snapped(Vector2(16,16)))
		1: 
			print("plot")
			
