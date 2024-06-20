extends Area2D

var timer = 0

func _physics_process(delta):
	# self.look_at(get_global_mouse_position())
	# if Input.get_action_raw_strength("Shoot") && timer <= 0:
		# shoot()
		# timer = 1
	
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	


func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)



func _on_timer_timeout():
	# timer = 0
	shoot()
