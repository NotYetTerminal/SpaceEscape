extends Node


@export var meteroite_scene: PackedScene
var score : int = 0


func _ready() -> void:
	new_game()


func new_game() -> void:
	$Player.start()
	$MeteroiteTimer.start()
	$ScoreTimer.start()


func game_over() -> void:
	$MeteroiteTimer.stop()
	$ScoreTimer.stop()

func _on_meteroite_timer_timeout() -> void:
	var meteroite: RigidBody2D = meteroite_scene.instantiate()
	var value: float = randf() * 480
	meteroite.position = Vector2(800, value)
	
	var velocity = Vector2(-randf_range(150.0, 250.0), 0.0)
	meteroite.linear_velocity = velocity
	
	add_child(meteroite)
	print(meteroite.position)


func _on_score_timer_timeout():
	score += 1
