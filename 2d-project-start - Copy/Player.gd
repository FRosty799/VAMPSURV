extends CharacterBody2D

@onready var Camera = $Camera2D

signal health_depleted

var health = 100.0

var die: bool = false


func _ready():
	Camera.set("position", Vector2(100, 0))

func _physics_process(delta):
	
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		$PlayerPivot/HappyBoo.play_walk_animation()
	else:
		$PlayerPivot/HappyBoo.play_idle_animation()
	


	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
			die = true


