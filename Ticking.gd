extends Node2D


func _ready():
	self.visible = false
	$Timer.wait_time = Global.game_tempo
	Global.connect("RightCONT",self,"_continue")
	Global.connect("start",self,"start_the_ticking")

func _continue():
	$Timer.wait_time = Global.game_tempo
	$Timer.start()

func start_the_ticking():
	self.visible = true
	$Timer.wait_time = 6
	$Timer.start()

func _process(delta):
	$Label.text = str(int($Timer.time_left))


func _on_Timer_timeout():
	$Timer.stop()
	Global.game_started = false
	Global.money_collected += Global.current_money
	Global.save_data()
	Global.emit_signal("GameOver")
