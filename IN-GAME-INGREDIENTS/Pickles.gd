extends Node2D


# Declare member variables here. Examples:
# var a = 2
func _ready():
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_5")

func RightCONT_handle_5():
	queue_free()
