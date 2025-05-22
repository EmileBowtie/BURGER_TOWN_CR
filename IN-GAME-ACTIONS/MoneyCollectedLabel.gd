extends CanvasLayer


func _ready():
	visible = true
	if Global.money_collected >= 9999:
		$Label.text = str(9999)
	else:
		$Label.text = str(Global.money_collected)
	Global.connect("start",self,"on_start")
	Global.connect("GameOver",self,"over")
	pass 

func on_start():
	visible = false

