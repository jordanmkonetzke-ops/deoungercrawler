extends Area2D

var player=null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.modulate.a = lerp($Sprite2D.modulate.a,0.0,0.07)
	if $Sprite2D.modulate.a <= 0.05:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("fartcloud")
		area.get_parent().damage(1)
		var vector: Vector2=area.global_position-global_position
		vector=vector.normalized()* 100
		area.get_parent().velocity=vector
		print(area.get_parent().velocity)
		area.get_parent().flying = true
