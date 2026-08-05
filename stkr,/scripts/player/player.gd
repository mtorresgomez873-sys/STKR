extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

# ==========================
# STKR - Player Controller v1.0
# ==========================

@export var move_speed: float = 420.0
@export var jump_force: float = -650.0

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:

	# Aplicar gravedad
	if !is_on_floor():
		velocity.y += gravity * delta

	# Movimiento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * move_speed

	# Girar el personaje
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true

	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	move_and_slide()
