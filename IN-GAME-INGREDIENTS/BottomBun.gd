extends Node2D



func _ready():
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_1")

func RightCONT_handle_1():
	queue_free()
