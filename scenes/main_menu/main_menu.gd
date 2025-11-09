extends Control

@export var next_scene_path: String = "res://scenes/levels/level_1/level_1.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(next_scene_path)
