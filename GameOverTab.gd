extends CanvasLayer

var stop = false

func _ready():
	stop = false
	visible = false
	$Shadow.visible = false
	Global.connect("GameOver",self,"GameOver_handle")
	pass 

func GameOver_handle():
	Global.game_tempo = 6
	visible = true
	$AnimationPlayer.play("GameOverRelease")
	$GAME_OVER.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "GameOverRelease":
		get_tree().paused = true
		$Sprite.visible = true
		$Shadow.visible = true
		stop = true
		$AnimationPlayer.stop()

func _on_Restart_pressed():
	$BUTTON_SOUND_PLAYER.play()
	Global.game_started = false
	Global.money_collected += Global.score
	Global.phase = 5
	Global.score = 0
	Global.save_data()
	Global.current_money = 0
	stop = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_Continue_pressed():
	ad_watched()

func ad_watched():
	#$Sprite.visible = false
	#$COUNT_DOWN/COUNT_DOWN_ANIMATION.play("count_down")
	pass


func _on_COUNT_DOWN_ANIMATION_animation_finished(anim_name):
	if Global.score==2:
		Global.phase = 10
		Global.game_tempo = 5
	if Global.score==4:
		Global.phase = 30
		Global.game_tempo = 4
	$BUTTON_SOUND_PLAYER.play()
	Global.game_started = true
	Global.game_overed = false
	get_tree().paused = false
	Global.emit_signal("RightCONT")
	Global.game_overed = false
	Global.emit_signal("_continue")
	self.visible = false
