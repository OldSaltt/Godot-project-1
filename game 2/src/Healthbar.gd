extends Control


onready var Health_Actual = $HealthActual
onready var Health_Missing = $HealthMissing
onready var _Tween = $Tween


func health_updated (health, amount):
	Health_Actual.value = health
	_Tween.interpolate_property(Health_Missing, "value" , Health_Missing.value, health , 0.4 , Tween.EASE_IN_OUT)


