extends Area2D

signal hit

@export var speed: float = 300
@export var sprite_size: Vector2 = Vector2(128, 128)
var screen_size: Vector2


func _ready() -> void:
	screen_size = get_viewport_rect().size
	start()


func _process(delta: float) -> void:
	var velocity: float = 0
	if Input.is_action_pressed("move_down"):
		velocity += speed
	if Input.is_action_pressed("move_up"):
		velocity -= speed
	
	position.y += velocity * delta
	position.y = clamp(position.y, sprite_size.y / 2, screen_size.y - sprite_size.y / 2)


func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)


func start() -> void:
	position = Vector2(100, screen_size.y / 2)
	show()
	$CollisionShape2D.disabled = false
