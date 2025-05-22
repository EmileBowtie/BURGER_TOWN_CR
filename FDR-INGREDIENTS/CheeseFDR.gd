extends Node2D


# Declare member variables here. Examples:
# var a = 2
func _ready():
	Global.connect("RightCONT",self,"RightCONT_handle_FDR_TB")
	pass 

func RightCONT_handle_FDR_TB():
	$RigidBody2D.gravity_scale = 8
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Cheese-Appear":
		pass
		#$RigidBody2D.gravity_scale = 1.5
