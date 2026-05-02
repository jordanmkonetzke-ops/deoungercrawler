extends Area2D
var canRestart=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func restartanimation():
	if canRestart:
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.frame=0
		$CollisionShape2D.disabled=false
		visible=true	
		canRestart=false	




func _on_animated_sprite_2d_animation_looped() -> void:
	canRestart=true
	$CollisionShape2D.disabled=true
	visible=false
