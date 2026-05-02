extends Area2D
var player = null
var KeysTaken=false
@export var teleport: Marker2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = str(player)
	if Input.is_action_just_pressed("E") and KeysTaken==true and player!=null and $Sprite2D.animation=="closed":
		$Sprite2D.animation="open"
	elif Input.is_action_just_pressed("E") and KeysTaken==true and player!=null and $Sprite2D.animation=="open":
		
		if teleport!=null:
			
			player.get_parent().position=teleport.global_position
			
func _on_area_entered(area: Area2D) -> void:
	print(area)
	if area.is_in_group("player"):
		player=area
		


#func _on_body_entered(body: Node2D) -> void:
	
	#if body.is_in_group("player"):
		#player=body
		
