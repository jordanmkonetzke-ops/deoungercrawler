extends CharacterBody2D
@export var speed=5
@export var health=500
var unchangeingSpeed = 0
var CanMove=true
var flying=false
var flashing = true
var DamageSources = []



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$RichTextLabel.text=str(health)
	unchangeingSpeed = speed
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if flying==false:
		velocity = Vector2.ZERO		
		
	else:
		speed -= 0.5
		if speed < 30:
			speed = unchangeingSpeed
			flying = false
	if Input. is_action_pressed("Up") and CanMove:
		velocity.y +=-1.0
		$AnimatedSprite2D.play("up")
		$sword.position = $UpPos.position
		$sword.rotation_degrees=0
	if Input.is_action_pressed("Down") and CanMove:
		velocity.y +=1.0
		$AnimatedSprite2D.play("down")
		$sword.position = $DownPos.position
		$sword.rotation_degrees=180
	if Input. is_action_pressed("Left") and CanMove:
		velocity.x +=-1.0
		$AnimatedSprite2D.play("left")
		$sword.position = $LeftPos.position
		$sword.rotation_degrees=270
	if Input. is_action_pressed("Right") and CanMove:
		velocity.x +=1.0
		$AnimatedSprite2D.play("right")
		$sword.position = $RightPos.position
		$sword.rotation_degrees=90
		
	if velocity.length()>0 and not flying:
		
		velocity = speed*velocity.normalized()
	
	
	move_and_slide()
	if Input.is_action_just_pressed("Hit"):
		$sword.restartanimation()
	
	
	

func BigDamage():
	$DamageTimer.stop()
	for d in DamageSources:
		damage(d.damage)

func damage(damage):
	$"FlickerSpeed/damage flicker last time timer".start()
	$FlickerSpeed.start()
	health -= damage
	$RichTextLabel.text=str(health)
	if health<=0:
		queue_free()
	

func _on_hitbox_area_entered(area: Area2D) -> void:

	if area.is_in_group("bullet"):
		DamageSources.append(area)


func _on_hitbox_body_entered(body: Node2D) -> void:

	if body.is_in_group("bullet"):
		DamageSources.append(body)


func _on_flicker_speed_timeout() -> void:
	if $AnimatedSprite2D.visible == true:
		$AnimatedSprite2D.visible = false
	else: 
		$AnimatedSprite2D.visible = true


func _on_damage_flicker_last_time_timer_timeout() -> void:
	$FlickerSpeed.stop()
	$AnimatedSprite2D.visible = true
	$DamageTimer.start()
	


func _on_damage_timer_timeout() -> void:
	if DamageSources.size() > 0:
		BigDamage()


func _on_hitbox_body_exited(body: Node2D) -> void:
	DamageSources.erase(body)


func _on_hitbox_area_exited(area: Area2D) -> void:
	DamageSources.erase(area)
