extends Panel

@onready var label_message :Label= $VBoxContainer/Label_Message
@onready var label_time :Label= $Margin/Label_Time
@onready var ticker_ui := $Margin/CenterContainer/TickerUI

var timer_active : bool
var timer_type


func _ready():
	label_message.text = ""
	GlobalTimer.connect("global_timer_start", on_global_timer_started)
	GlobalTimer.connect("global_timer_stop", on_global_timer_stopped)
	GlobalTimer.connect("global_timer_tick", on_global_timer_ticked)


func on_global_timer_started(p_timer_type, p_message) -> void:
	timer_active = true
	timer_type = p_timer_type
	label_message.text = p_message
	set_display_time()
	ticker_ui.pulse(p_timer_type == GlobalTimer.TIMER_TYPE.COUNTDOWN)


func on_global_timer_stopped() -> void:
	timer_active = false	
	label_message.text = ""


func on_global_timer_ticked(time_elapsed : bool):
	if not timer_active:
		return
	AudioManager.tick()
	if not time_elapsed:
		ticker_ui.pulse(timer_type == GlobalTimer.TIMER_TYPE.COUNTDOWN)
	set_display_time()


func set_display_time() -> void:
	var seconds = GlobalTimer.get_time_left() if timer_type == GlobalTimer.TIMER_TYPE.COUNTDOWN else GlobalTimer.get_elapsed_time()	
	label_time.text = str(seconds)
