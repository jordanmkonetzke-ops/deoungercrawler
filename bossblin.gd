extends CharacterBody2D

var player=null
var cantakedmg=true
@export var speed=50
@export var health=1
@export var bullet: PackedScene
@export var bulletspeed=2000
@export var fartcloud: PackedScene
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#if bullet
	
	$Label.text=str(health)
	if health<=0:
		queue_free()
		
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
	if cantakedmg==true:
		health-=1
		cantakedmg=false
		$invincibiltyframes.start()
	
	
	
	
	if health==0:
		slepwithdemfishys()


func _on_shoot_timer_timeout() -> void:
	if player!=null:
		var temp=bullet.instantiate()
		temp.rotation=global_position.angle_to_point(player.global_position) 
		temp.position=global_position
		temp.speed = bulletspeed
		get_parent().add_child(temp)





#func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("entered")
	#if body.is_in_group("player"):
		#
		#player=body
		#$ShootTimer.start()
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#print("exited")
	#if body==player:
		#
		#player=null
		#$ShootTimer.stop()


func _on_area_2d_area_exited(area: Area2D) -> void:
	print("exited")
	if area==player:
		
		#player=null
		$Shooting/ShootTimer.stop()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("entered")
	if area.is_in_group("player"):
		
		player=area
		$Shooting/ShootTimer.start()

func _on_invincibiltyframes_timeout() -> void:
	cantakedmg=true	
	

func _on_fart_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("OhMyStomach!!!!!")
		$fart/FARTTIMER.start()
		
func _on_fart_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$fart/FARTTIMER.stop()
		
func _on_farttimer_timeout() -> void:
	var temp=fartcloud.instantiate()
	temp.global_position=global_position
	get_parent().add_child(temp)
	print("PFTTTTTFFTTFTTFT XD dies")
