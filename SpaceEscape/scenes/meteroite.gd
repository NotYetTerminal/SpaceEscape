extends RigidBody2D

@export var images_array: Array[CompressedTexture2D]


func _ready() -> void:
	var image: CompressedTexture2D = images_array[randi_range(0, len(images_array) - 1)]
	$CollisionShape2D/Sprite2D.texture = image


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
