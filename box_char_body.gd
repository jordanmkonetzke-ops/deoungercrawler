extends CharacterBody2D
var player=null	
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	if player!=null:
		#var distance_vector= player.position - global_position
		#linear_velocity=distance_vector * -1
		
		#find_player_direction(player)
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player=area
		velocity=area.get_parent().velocity


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area==player:
		player=null
		velocity=Vector2.ZERO
		
		
func find_player_direction(playerA):
	#ar direction_x= playerA.position.x-position.x
	#ar direction_y= playerA.position.y-position.y
	#ar a = atan2(direction_y, direction_x)
	#velocity= 100 * Vector2(sin(a),cos(a))
	var a = global_position.angle_to_point(player.global_position) 
	
	velocity.y = SPEED *sin(a) *-1
	velocity.x = SPEED *cos(a) *-1
