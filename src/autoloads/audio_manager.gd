extends Node

@onready var tick_player : AudioStreamPlayer = $TickPlayer

func tick() -> void:
	tick_player.play(0)
