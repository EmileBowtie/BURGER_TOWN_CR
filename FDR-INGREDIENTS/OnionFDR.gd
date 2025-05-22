extends Node2D

func _ready():
	Global.connect("RightCONT",self,"RightCONT_handle_FDR_TB")
	pass 

func RightCONT_handle_FDR_TB():
	#$RigidBody2D.gravity_scale = 8
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Onions-Appear":
		pass
		#$RigidBody2D.gravity_scale = 1.5
