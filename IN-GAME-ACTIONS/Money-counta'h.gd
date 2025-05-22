extends CanvasLayer



func _ready():
	visible = false
	$Label.text = str(Global.score)
	Global.connect("RightCONT",self,"on_RightCONT")
	Global.connect("start",self,"on_start")
	pass 

func _physics_process(delta):
	if Global.score >= 9999:
		$Label.text = str(9999)
	else:
		$Label.text = str(Global.current_money)

func on_start():
	$Label.text = str(Global.current_money)
	visible = true


func on_RightCONT():
	$AudioStreamPlayer.play()
	pass
