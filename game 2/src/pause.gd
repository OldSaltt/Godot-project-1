extends Control


func _ready():
	visible = false
func _input(event):
	if event.is_action_pressed("pause"):
		var paused_state = not get_tree().paused
		get_tree().paused = paused_state
		visible = paused_state
		
		
func _on_quit_pressed():
	get_tree().quit()
	
func _on_returntomenu_pressed():
	get_tree().set_pause(false)
	get_tree().change_scene("res://Scenes/main menu.tscn")
	
