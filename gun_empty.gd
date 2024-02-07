extends Marker2D



const bulletPath = preload("res://bullet.tscn")

func _physics_process(delta):
	var mouse = get_global_mouse_position()
	var angle = global_position.angle_to_point(mouse)
	rotation = angle
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				shoot()

func shoot():
	var bullet = bulletPath.instantiate()
	get_parent().get_parent().add_child(bullet)
	bullet.global_position = $weapon.global_position
	bullet.global_rotation = $weapon.global_rotation
	var velo = Vector2(cos(bullet.global_rotation), sin(bullet.global_rotation))
	velo *= 1000
	bullet.linear_velocity = velo
	#bullet.rotation = $Marker2D.rotation
	
