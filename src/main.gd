extends Control

const workout_list := preload("res://src/ui/workout_list.tscn")

func _on_button_countdown_pressed():
	GlobalTimer.wait_for(3, GlobalTimer.TIMER_TYPE.COUNTDOWN, "GET READY")


func _on_button_stopwatch_pressed():
	GlobalTimer.wait_for(5, GlobalTimer.TIMER_TYPE.STOPWATCH, "HOLD")


func _on_button_edit_workout_pressed():
	get_tree().change_scene_to_packed(workout_list)
