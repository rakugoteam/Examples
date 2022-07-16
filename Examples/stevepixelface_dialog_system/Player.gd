extends KinematicBody2D

const Speed = 24

onready var animSprite = $AnimSprite

func _physics_process(delta: float) -> void:
	var dir_h = Input.get_axis("ui_left", "ui_right")
	
	if dir_h < 0:
		animSprite.flip_h = true
	elif dir_h > 0:
		animSprite.flip_h = false
		
	if dir_h == 0:
		if animSprite.animation != "idle":
			animSprite.play("idle")
	else:
		if animSprite.animation != "walk":
			animSprite.play("walk")
	
	move_and_slide(Vector2(dir_h, 0) * Speed)
