extends "mons.gd"
@export var projectile : PackedScene

func attack():
	if !player:
		return
	if (attackSpeedTimer.time_left > 0):
		return
	var b = projectile.instantiate()
	var direction = (player.global_position - global_position).normalized()
	b.direction = direction;
	add_child(b)
	attackSpeedTimer.start()

func chase():
	# dont make tomatoes chase players
	pass

func _on_attack_range_body_entered(body):
	if (body.name == "Player"):
		playerAttack = true

func _on_attack_range_body_exited(body):
	if (body.name == "Player"):
		playerAttack = false
		attackSpeedTimer.stop()
		playerAttack = false
