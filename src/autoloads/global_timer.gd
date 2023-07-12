extends Node

enum TIMER_TYPE {COUNTDOWN, STOPWATCH}

signal global_timer_start(timer_type, message)
signal global_timer_stop
signal global_timer_tick

var active : bool = false
var wait_time : int = 0
var elapsed_time : int = 0

@onready var _ticker :Timer= $Ticker


func _ready():
	_ticker.connect("timeout", _on_tick)


func _on_tick():
	elapsed_time += 1
	global_timer_tick.emit()
	if elapsed_time >= wait_time:
		active = false
		global_timer_stop.emit()


func wait_for(seconds : int, timer_type : TIMER_TYPE, message : String = "") -> void:
	active = true
	wait_time = seconds
	elapsed_time = 0
	global_timer_start.emit(timer_type, message)
	global_timer_tick.emit()	
	_ticker.start()


func get_elapsed_time() -> int:
	return elapsed_time


func get_time_left() -> int:
	return wait_time - elapsed_time
