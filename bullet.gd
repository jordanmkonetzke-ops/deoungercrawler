class_name Bullet extends Area2D
@export var speed=2000
@export var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position+=transform.x*speed*delta





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Wall"):
		
		queue_free()
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("sword"):
		$Sprite2D.modulate=Color(0, 0, 1)
		speed*=-1
		set_collision_layer_value(5,false)
		set_collision_layer_value(3,true)
