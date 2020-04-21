extends Control


var lvl1 = preload("res://Scenes/gamescene.tscn")


func _ready():
	get_node("options").visible = false
	get_node("main menu").visible = true


func _on_playbutton_pressed():
	get_tree().change_scene_to(lvl1)
	
func _on_quitbutton_pressed():
	get_tree().quit()


func _on_optionbutton_pressed() -> void:
		get_node("options").visible = true
		get_node("main menu").visible = false



func _on_Button2_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen
	if OS.window_fullscreen :
		get_node("options/Button2").set_text("ON")
	elif !OS.window_fullscreen :
		get_node("options/Button2").set_text("OFF")


func _on_Button3_pressed() -> void:
	pass
	#ProjectSettings.set_setting("Display/Window/Width", 800)
	#ProjectSettings.set_setting("Display/Window/Height", 600)
	#ProjectSettings.save()

func _on_Button4_pressed() -> void:
	get_node("options").visible = false
	get_node("main menu").visible = true
