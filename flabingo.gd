extends CharacterBody2D
@export var speed: float=50
var player=null
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var playerInFlabingo=false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E") and playerInFlabingo==true:
		player.get_parent().set_collision_mask_value(1,true)
		playerInFlabingo = false
		player.get_parent().CanMove=true
	elif player!=null and  Input.is_action_just_pressed("E") and !playerInFlabingo:
		
		if player.get_parent().CanMove:
			player.get_parent().position=$"player point".global_position
			player.get_parent().CanMove=false
			player.get_parent().set_collision_mask_value(1,false)
			playerInFlabingo=true
			
	
		
func _physics_process(delta: float) -> void:
	if playerInFlabingo==true:
		player.get_parent().position=$"player point".global_position
	if Input. is_action_pressed("Left") and playerInFlabingo==true:
		rotation_degrees -= 5
	if Input. is_action_pressed("Right") and playerInFlabingo==true:
		rotation_degrees += 5
	if Input. is_action_pressed("Up") and playerInFlabingo==true:
		var forward_direction = Vector2(0, 1).rotated(rotation)
		velocity = forward_direction * speed
	elif Input. is_action_pressed("Down") and playerInFlabingo==true:
		var forward_direction = Vector2(0, -1).rotated(rotation)
		velocity = forward_direction * speed
	else:
		velocity=Vector2.ZERO
	
		
	


	move_and_slide()
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("player"):
		player=area


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area==player:
		player=null
