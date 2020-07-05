extends KinematicBody2D

var run_speed = 350
var jump_speed = -1000
var gravity = 2500

var velocity = Vector2()

export(int) var vida = 100
export(int) var d_sierra = 25

var mis_gemas = 0

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if is_on_floor() and jump:
		velocity.y = jump_speed
		$AnimatedSprite.play("jump")
	if right:
		velocity.x += run_speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	if left:
		velocity.x -= run_speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	if !left and !right and !jump and is_on_floor():
		$AnimatedSprite.play("idle")
		$AnimatedSprite.flip_h = false
	
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if vida < 0:
		print("Game Over")

func hurt_sierra():
	vida -= d_sierra
