extends Node2D



func _ready():
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_FDR_TB")
	pass 

func RightCONT_handle_FDR_TB():
	#$RigidBody2D.gravity_scale = 8
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Pickles-Appear":
		pass
		#$RigidBody2D.gravity_scale = 1.5
		#$RigidBody2D.mode = RigidBody2D.MODE_STATIC
