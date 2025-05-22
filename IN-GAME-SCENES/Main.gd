extends Node2D


func _ready():
	$LOADING_SCREEN.visible = true
	Global.connect("three_x",self,"_three_x")
	Global.connect("five_x",self,"_five_x")
	Global.connect("start",self,"started")
	pass 

func started():
	$LOADING_SCREEN.visible = false

func _three_x():
	get_node("Upgrades").visible = true
	get_node("Upgrades/THREE_X/AnimationPlayer").play("POP_IN")
	get_node("Upgrades/THREE_X/THREE_X_SOUND").play()

func _five_x():
	get_node("Upgrades").visible = true
	get_node("Upgrades/FIVE_X/AnimationPlayer").play("POP_IN")
	get_node("Upgrades/FIVE_X/FIVE_X_SOUND").play()


func _on_TextureButton_pressed():
	$BUTTON_SOUND_PLAYER.play()
	$LOADING_SCREEN/AnimationPlayer.play("FADE_OUT")
	get_node("Background/FADED_PLAYER").stop()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FADE_OUT":
		get_tree().change_scene("res://Store.tscn")
