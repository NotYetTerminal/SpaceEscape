extends RigidBody2D

@export var images_array: Array[CompressedTexture2D]


func _ready() -> void:
	var image: CompressedTexture2D = images_array[randi_range(0, len(images_array) - 1)]
	$Sprite2D.texture = image
	var scale_value: float = randf_range(0.1, 1)
	scale = Vector2(scale_value, scale_value)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
