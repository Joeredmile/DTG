extends Node2D

var button_type = null
@onready var fade_transition: ColorRect = $fade_transition

 
func _on_start_pressed() -> void:
	button_type = "start"
	$fade_transition.show()
	$fade_transition/Fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	$fade_tr


func _on_options_pressed() -> void:
	button_type = "option"
	$fade_transition.show()
	$fade_transition/Fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
		
	elif button_type == "option" :
		get_tree().change_scene_to_file("res://Scenes/options.tscn")
