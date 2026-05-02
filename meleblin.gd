extends CharacterBody2D

var player=null
@export var speed=50
@export var health=1
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player!=null:
		#var distance_vector= player.position - global_position
		#linear_velocity=distance_vector * -1
		
		find_player_direction(player)
	
	
	move_and_slide()
	
		
func find_player_direction(playerA):
	#ar direction_x= playerA.position.x-position.x
	#ar direction_y= playerA.position.y-position.y
	#ar a = atan2(direction_y, direction_x)
	#velocity= 100 * Vector2(sin(a),cos(a))
	var a = global_position.angle_to_point(player.global_position) 
	
	velocity.y = speed *sin(a)
	velocity.x = speed *cos(a)
	

func _on_view_box_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("player"):
		player=area
		
	


func _on_view_box_area_exited(area: Area2D) -> void:
	if area==player:
		player=null
		
func slepwithdemfishys():
	queue_free()
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	health-=1
	
	if health==0:
		slepwithdemfishys()
