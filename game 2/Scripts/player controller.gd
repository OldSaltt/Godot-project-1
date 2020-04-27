extends KinematicBody2D



signal health_updated(health)
signal killed()

var maxhealth = 100
onready var invulnerabilitytime = $invulnerabilitytime
onready var health = maxhealth
var speed = 250
var x = 0
var y = 0 
const GRAVITY = 25
const MAXFALLSPEED = 500
const JUMPSPEED = 55
const JUMPMULT = 10






func _physics_process(delta):
	get_input()
	jump()
	gravity()
	move_and_slide(Vector2(x * speed, y), Vector2(0 , -1)) * delta






func jump():  #jummping mechanics
	if is_on_floor() and Input.is_action_pressed('jump'):
		y -= JUMPSPEED * JUMPMULT
	if Input.is_action_just_released("jump") and y < 0:
		y = 0


func gravity(): #how gravity and related velocity works
	if y >= MAXFALLSPEED :
		y = MAXFALLSPEED
	if is_on_floor() and y >= 5 :
		y = 5
	y += GRAVITY


func get_input(): #basic left right input with proper direction
	x=0    # reset speed to 0 if non of the "if" statements is met. (no need for else statement)
	if Input.is_action_pressed("right") :
		x += 1
		$Sprite.scale.x = 1
	if Input.is_action_pressed("left") :
		x -= 1
		$Sprite.scale.x = -1


	
func _process(_delta):   #animation management, to be changed.
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		$Sprite.play("run")
	
	elif Input.is_action_pressed("attackmelee"):
		$Sprite.play("attackmelee")
		
	elif Input.is_action_pressed("dash"):
		$Sprite.play("dash")
	else :
		$Sprite.play("idle")

func kill() :
	pass

func damage(amount):
	if invulnerabilitytime.is_stopped() :
		invulnerabilitytime.start()
		set_health(health - amount)

func set_health(value) :
	var pre_health = health
	health = clamp(value, 0, maxhealth)
	if pre_health != health :
		emit_signal("health_updated", health)
		if health == 0 :
			kill()
			emit_signal("killed")






