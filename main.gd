extends Node2D
var GiraffeKeyGotTaken = false
var TheKeyGotTaken = false
var BigKeyGotTaken = false
var CircleKeyGotTaken = false
var KeysTaken=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Player/Main Camera/TextureRect/KeyGirafe".hide()
	$"Player/Main Camera/TextureRect/KeyKey".hide()
	$"Player/Main Camera/TextureRect/KeyCircle".hide()
	$"Player/Main Camera/TextureRect/KeyBig".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#$"Main Camera".position=$Player.position
	if GiraffeKeyGotTaken==true and TheKeyGotTaken==true and BigKeyGotTaken==true and CircleKeyGotTaken==true:
		$LockedDoor.KeysTaken = true

func _on_area_2d_giraffe_area_entered(area: Area2D) -> void:
	GiraffeKeyGotTaken=true
	$GiraffeKey.queue_free()
	$"Player/Main Camera/TextureRect/KeyGirafe".show()


func _on_area_2d_the_area_entered(area: Area2D) -> void:
	TheKeyGotTaken=true
	$TheKey.queue_free()
	$"Player/Main Camera/TextureRect/KeyKey".show()

func _on_area_2_big_area_entered(area: Area2D) -> void:
	BigKeyGotTaken=true
	$BIGKey.queue_free()
	$"Player/Main Camera/TextureRect/KeyBig".show()

func _on_area_2d_circle_area_entered(area: Area2D) -> void:
	CircleKeyGotTaken=true
	$CircleKey.queue_free()
	$"Player/Main Camera/TextureRect/KeyCircle".show()


func _on_camera_trigger_area_entered(area: Area2D) -> void:
	var camera = $"Player/Main Camera"
	camera.get_parent().remove_child(camera)
	add_child(camera)
	camera.position = $BOSSCamera.position
	camera.zoom.x = 1.5
	camera.zoom.y = camera.zoom.x
	$CameraTrigger.set_collision_layer_value(1,true)
	$CameraTrigger.set_collision_mask_value(4,false)


func _on_dadoor_dadooropenedragebait() -> void:
	$Label2.position = $label2moving.position
