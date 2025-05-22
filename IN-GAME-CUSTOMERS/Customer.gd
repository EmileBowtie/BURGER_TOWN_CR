extends Sprite

func _ready():
	self.visible = false
	self.position = Vector2(680,1040)
	self.rotation_degrees = -81
# warning-ignore:return_value_discarded
	Global.connect("GameOver",self,"_on_GameOver")
	randomize()
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_c")
	Global.connect("_continue",self,"cont")
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("game_start"):
		Global.game_started = true
		$AnimationPlayer.play("WALK_IN")

func cont():
	frame = 0
	$AnimationPlayer.play("WALK_OUT")

func _on_GameOver():
	frame = 2
	$IdleAnimations.stop()
	$AnimationPlayer.play("Angry")

func RightCONT_handle_c():
	get_parent().get_node("OrderCloud").visible = false
	frame = 0
	$IdleAnimations.stop()
	$AnimationPlayer.play("Correct")
	get_parent().get_node("Label/AnimationPlayer").play("0.6")

func skin_change():
	randomize()
	var a = int(rand_range(1,15))
	if Global.current == 1:
		texture = load("res://PersonRegularSkins/PersonR%s.png"%str(a))
	if Global.current == 2:
		texture = load("res://FoodUnitSkins/PersonW%s.png"%str(a))
	if Global.current == 3:
		texture = load("res://RETROskins/PersonRETRO%s.png"%str(a))
	if Global.current == 4:
		texture = load("res://DeLightHouseSkins/President%s.png"%str(a))
	if Global.current == 5:
		texture = load("res://SpicePitSkins/PersonHELL%s.png"%str(a))

func _again():
	$AnimationPlayer.play("WALK_IN")

func _on_AnimationPlayer_animation_finished(anim_name):
	var random_idle_animation = int(rand_range(1,4))
	if anim_name == "WALK_IN":
		$AnimationPlayer.play("OrderCloudAppear")
		$IdleAnimations.play("Idle1")
	if anim_name == "Correct":
		$AnimationPlayer.play("WALK_OUT")
	if anim_name == "WALK_OUT":
		$AnimationPlayer.play("OrderCloudReset")
		skin_change()
	if anim_name == "OrderCloudReset":
		_again()



func _on_AnimationPlayer_animation_started(anim_name):
	if anim_name == "WALK_OUT":
		$IdleAnimations.play("RESET")
