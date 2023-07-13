extends Control

var _last_angle_to : float = 0
var _angle_to : float = 0
var _radius := 125
var _clock_wise : bool

func _process(_delta):
	if _last_angle_to == _angle_to:
		return	
	_last_angle_to = _angle_to
	queue_redraw()


func _draw():
	if _clock_wise:
		draw_circle_arc_poly(Vector2.ZERO, _radius, _angle_to, 360, Color.AQUA)
	else :
		draw_circle_arc_poly(Vector2.ZERO, _radius, 360, 360 - _angle_to, Color.AQUA)


func pulse(clock_wise : bool) -> void:
	_clock_wise = clock_wise
	var tween = create_tween()
	tween.tween_property(self, "_angle_to", 360, 1).from(0)


# directly from: http://docs.godotengine.org/en/latest/tutorials/2d/custom_drawing_in_2d.html
func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 64
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])
 
	for i in range(nb_points+1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	draw_polygon(points_arc, colors)
