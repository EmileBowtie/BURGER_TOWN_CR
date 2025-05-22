extends Node2D

onready var music = preload("res://SOUND_EFFECTS/MUSIC/BURGER_TOWN_MUSIC.mp3")

func _ready():
	$SMOG.visible = false
	Global.connect("start",self,"started")
	Global.connect("GameOver",self,"over")
	Global.connect("_continue",self,"_con_tinue")
	if Global.current == 1:
		$BurgerTown.visible = true
		$BurgerTown/AnimationPlayer.play("CarIdle")
		$Army.visible = false
		$Retro.visible = false
		$TheWhiteHouse.visible = false
		$Hell.visible = false
		$Hell/AnimationPlayer.stop()
		music = load("res://SOUND_EFFECTS/MUSIC/BURGER_TOWN_MUSIC.mp3")
	if Global.current == 2:
		$BurgerTown.visible = false
		$BurgerTown/AnimationPlayer.stop()
		$Army.visible = true
		$Retro.visible = false
		$TheWhiteHouse.visible = false
		$Hell.visible = false
		$Hell/AnimationPlayer.stop()
		music = load("res://SOUND_EFFECTS/MUSIC/OVER_THERE.mp3")
	if Global.current == 3:
		$BurgerTown.visible = false
		$BurgerTown/AnimationPlayer.stop()
		$Army.visible = false
		$Retro.visible = true
		$TheWhiteHouse.visible = false
		$Hell.visible = false
		$Hell/AnimationPlayer.stop()
		music = load("res://SOUND_EFFECTS/MUSIC/1950S_MUSIC.MP3")
	if Global.current == 4:
		$BurgerTown.visible = false
		$BurgerTown/AnimationPlayer.stop()
		$Army.visible = false
		$Retro.visible = false
		$TheWhiteHouse.visible = true
		$Hell.visible = false
		$Hell/AnimationPlayer.stop()
		music = load("res://SOUND_EFFECTS/MUSIC/HAIL_TO_THE_CHIEF.MP3")
		$TheWhiteHouse/AnimationPlayer.play("ChineseBalloonMove")
	if Global.current == 5:
		$BurgerTown.visible = false
		$BurgerTown/AnimationPlayer.stop()
		$Army.visible = false
		$Retro.visible = false
		$TheWhiteHouse.visible = false
		$Hell.visible = true
		$Hell/AnimationPlayer.play("Idle")
		music = load("res://SOUND_EFFECTS/MUSIC/INFERNO_MUSIC.mp3")
	$FADED_PLAYER.stream = music
	$FADED_PLAYER.play()


func started():
	$FADED_PLAYER.stop()
	#$IN_GAME_PLAYER.volume_db = 0.75
	$IN_GAME_PLAYER.stream = music
	$IN_GAME_PLAYER.play()
	
	$AnimationPlayer.play("FADE_IN")

func over():
	$SOUND_ANIMATION.play("GAME_OVER")

func _con_tinue():
	$SOUND_ANIMATION.play("CONTINUE")
