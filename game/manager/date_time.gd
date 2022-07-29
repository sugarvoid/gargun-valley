extends Reference
class_name DateTime


var minunte: int = 0 
var hour: int = 0
var day = 1
var month = 1
var year: int = 1999
var current_day_of_week: int = 0

func get_date_string() -> String:
	return "0:00pm"

func _init():
	pass

func _ready():
	self.day = 13

func set_date():
	pass

func sayHey():
	print('het')


func add_days(days: int):
	self.day += days
