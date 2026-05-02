extends Area2D
var player=null
@export var bullet: PackedScene
@export var speed=2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

	
func _on_area_entered(area: Node2D) -> void:
	if area.is_in_group("player"):
		player=area
		$ShootTimer.start()


func _on_area_exited(body: Node2D) -> void:
	if body==player:
		player=null
		$ShootTimer.stop()


func _on_shoot_timer_timeout() -> void:
	if player!=null:
		var temp=bullet.instantiate()
		temp.rotation=global_position.angle_to_point(player.global_position) 
		temp.position=global_position
		temp.speed = speed
		get_parent().add_child(temp)

func slepwithdemfishys():
	queue_free()
	
func _on_killbox_area_entered(area: Area2D) -> void:
	slepwithdemfishys()
