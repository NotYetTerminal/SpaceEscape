extends Node


@export var meteroite_scene: PackedScene
@export var background_object_scene: PackedScene
var score : int = 0


func new_game() -> void:
	score = 0
	$Player.start()
	$MeteroiteTimer.start()
	$BOTimer.start()
	$ScoreTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Oh no!\nThe meteorites!")
	get_tree().call_group("meteroite", "queue_free")


func game_over() -> void:
	$MeteroiteTimer.stop()
	$BOTimer.stop()
	$ScoreTimer.stop()
	$HUD.show_game_over()


func _on_meteroite_timer_timeout() -> void:
	var meteroite: RigidBody2D = meteroite_scene.instantiate()
	var value: float = randf() * 720
	meteroite.position = Vector2(1400, value)
	
	var velocity = Vector2(-randf_range(250, 350) - score * 8, 0)
	meteroite.linear_velocity = velocity
	
	add_child(meteroite)


func _on_background_object_timer_timeout() -> void:
	var background_object: RigidBody2D = background_object_scene.instantiate()
	var value: float = randf() * 720
	background_object.position = Vector2(1400, value)
	
	var velocity = Vector2(-200 - score * 8, 0)
	background_object.linear_velocity = velocity
	
	add_child(background_object)


func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

