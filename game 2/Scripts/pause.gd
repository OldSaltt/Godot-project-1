extends Control



func _ready():
	visible = false
func _input(event):
	if event.is_action_pressed("pause"):
		var paused_state = not get_tree().paused
		get_tree().paused = paused_state
		visible = paused_state
		
		
