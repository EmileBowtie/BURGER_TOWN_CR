extends Node2D



func _ready():
# warning-ignore:return_value_discarded
	Global.connect("RightCONT",self,"RightCONT_handle_7")

func RightCONT_handle_7():
	queue_free()



