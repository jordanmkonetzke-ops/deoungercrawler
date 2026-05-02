extends Area2D

var player=null
signal dadooropenedragebait
@export var teleport: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
			
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E") and player!=null and $AnimatedSprite2D.animation=="closed":
		$AnimatedSprite2D.animation="open"
		
		$velocitytimer.start()
		player.get_parent().speed = 100
		player.get_parent().velocity.y = 1
		player.get_parent().flying = true
	elif Input.is_action_just_pressed("E") and player!=null and $AnimatedSprite2D.animation=="open":
		if teleport!=null:
			player.get_parent().position=teleport.global_position
			dadooropenedragebait.emit()
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player=area
		


func _on_velocity_timer_timeout() -> void:
	
	player.get_parent().speed=1
	
