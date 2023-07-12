extends Control


func _on_button_countdown_pressed():
	GlobalTimer.wait_for(3, GlobalTimer.TIMER_TYPE.COUNTDOWN, "GET READY")


func _on_button_stopwatch_pressed():
	GlobalTimer.wait_for(5, GlobalTimer.TIMER_TYPE.STOPWATCH, "HOLD THE POSE")
