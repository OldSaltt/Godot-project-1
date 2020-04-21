extends Control

func _ready():
	pass#Global.kills = 0


func _on_playbutton_pressed():
	get_tree().change_scene("src/gamescene.tscn")
	
func _on_quitbutton_pressed():
	get_tree().quit()
