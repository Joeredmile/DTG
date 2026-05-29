extends Node2D




func _on_backtoomainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")



func _on_foster_pressed() -> void:
	$foster/AudioStreamPlayer2D.play()

	
