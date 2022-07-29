extends Node
class_name TimeManager

signal _on_the_day
signal _on_the_hour
signal _on_the_week
signal _on_the_minunte



onready var timer: Timer = get_node("Timer")

# One in-game min = ten second 
const MIN_LENGTH: int = 5

var minunte: int = 0 
var hour: int = 0
var day: int = 1
var month: int = 1
var year: int = 1999
var current_day_of_week: int = 0

var is_paused: bool = false

enum PHASES {
	DAWN,
	MORNING,
	AFTERNOON,
	EVENING,
	NIGHT
}


const DAYS: Array = [
	"Sunday",
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday"
]

const MONTH = [
	"Jan",
	"Fed",
	"Mar"
]


var date_time: Dictionary = {
	"min": 5
}

func advance_month() -> void:
	#TODO: add logic
	pass

func advance_day():
	if current_day_of_week == 6:
		emit_signal("_on_the_week")
		print('new week')
		current_day_of_week = 0
	else:
		current_day_of_week = current_day_of_week + 1

func get_day_string():
	return DAYS[current_day_of_week]

func advance_hour():
	emit_signal("_on_the_hour")
	if hour == 23:
		hour = 0
		advance_day()
	else:
		hour = hour + 1

func _ready() -> void:
	_start_ticker()

func _start_ticker():
	self.timer.wait_time = MIN_LENGTH
	timer.start()

func load_datetime():
	pass

func start_time():
	timer.paused = false
	self.is_paused = false

func increse_time():
	pass

func pause_time():
	timer.paused = true
	self.is_paused = true

func tick():
	minunte = minunte + 1
	self.emit_signal("_on_the_minunte", get_time())
	if minunte == 60:
		advance_hour()
		minunte = 0

func get_time() -> String:
	return "{0}:{1}".format([str(hour).pad_zeros(2),str(minunte).pad_zeros(2)])

func get_date() -> String:
	return "{0}/{1}/{2}".format([month, str(day).pad_zeros(2), year])

func _init():
	pass
	

	
func set_date():
	pass
	
	
func add_days(days: int):
	self.day += days

func _on_Timer_timeout() -> void:
	tick()
	print("tick")
