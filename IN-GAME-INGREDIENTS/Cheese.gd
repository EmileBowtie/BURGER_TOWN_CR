extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_2")

func RightCONT_handle_2():
	queue_free()


