extends Node


# One in-game min = ten second 
const MIN_LENGTH = 10

var mintune: int = 0 
var hour: int = 0

var day = 1
var month = 1
var year: int = 1999
var current_day_of_week: int = 0

var is_paused: bool = false

var timer: Timer


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
		### Signals.emit_signal("_new_week")
		print('new week')
		current_day_of_week = 0
	else:
		current_day_of_week = current_day_of_week + 1

func get_day_string():
	return DAYS[current_day_of_week]

func advance_hour():
	##### Signals.emit_signal("_on_the_hour")
	if hour == 23:
		hour = 0
		advance_day()
	else:
		hour = hour + 1


func _ready() -> void:
	timer = Timer.new()
	# warning-ignore:return_value_discarded
	timer.connect("timeout", self, "_on_timer_timeout") 
	# timer.set_wait_time(MIN_LENGTH) #value is in seconds: 600 seconds = 10 minutes
	add_child(timer) 
	timer.start() 
	
	
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
	mintune = mintune + 1
	if mintune == 60:
		advance_hour()
		mintune = 0

func get_time() -> String:
	return "{0}:{1}".format([str(hour).pad_zeros(2),str(mintune).pad_zeros(2)])

func get_date() -> String:
	return "{0}/{1}/{2}".format([month, str(day).pad_zeros(2), year])

func _on_timer_timeout() -> void:
	tick()

