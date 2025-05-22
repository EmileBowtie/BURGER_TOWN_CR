extends Node2D



func _ready():
	$RigidBody2D/AnimationPlayer.play("TopBun-Appear")
	Global.connect("RightCONT",self,"RightCONT_handle_FDR_TB")
	pass 

func RightCONT_handle_FDR_TB():
	queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "TopBun-Appear":
		pass
		#$RigidBody2D.gravity_scale = 1.5
