extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = true
	Global.connect("start",self,"on_start")
	pass # Replace with function body.

func on_start():
	self.visible = false


func _on_TextureButton_pressed():
	Global.in_shop = true
	$CareerScene.visible = true

func _on_AnimationPlayer_animation_finished(anim_name):
	$CareerScene/AnimationPlayer.play("Idle")
