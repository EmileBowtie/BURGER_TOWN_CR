extends Control

var BottomBun_Resource = preload("res://IN-GAME-INGREDIENTS/BottomBun.tscn")
var Patty_Resource  = preload("res://IN-GAME-INGREDIENTS/Patty.tscn")
var Cheese_Resource  = preload("res://IN-GAME-INGREDIENTS/Cheese.tscn")
var Tomato_Resource  = preload("res://IN-GAME-INGREDIENTS/Tomato.tscn")
var Onion_Resource  = preload("res://IN-GAME-INGREDIENTS/Onion.tscn")
var Pickles_Resource  = preload("res://IN-GAME-INGREDIENTS/Pickles.tscn")
var TopBun_Resource  = preload("res://IN-GAME-INGREDIENTS/TopBun.tscn")

onready var BunButton = $Buttons/BunButton
onready var PattyButton = $Buttons/PattyButton
onready var CheeseButton = $Buttons/CheeseButton
onready var PickleButton = $Buttons/PickleButton
onready var TomatoButton = $Buttons/TomatoButton
onready var OnionButton = $Buttons/OnionButton

var layer = 0
var bottom_bun_spawned = false
var buttons = []
var positions = [
	Vector2(60, 1080),
	Vector2(270, 1080),
	Vector2(480, 1080),
	Vector2(60, 1190),
	Vector2(270, 1190),
	Vector2(480, 1190)
	]

func _ready():
	
	buttons = [
	BunButton,
	PattyButton,
	CheeseButton,
	PickleButton,
	TomatoButton,
	OnionButton
	]

	bottom_bun_spawned = false
	Global.input_bottom_bun_spawned = false
	Global.input_topbun_spawned = false
	layer = 0
	for i in range(Global.input_layers.size()):
		Global.input_layers[i] = null
	Global.connect("RightCONT",self,"cont")
	Global.connect("GameOver",self,"over")
	Global.connect("bell_ringed",self,"bl_reset")

func cont():
	bottom_bun_spawned = false
	Global.input_bottom_bun_spawned = false
	Global.input_topbun_spawned = false
	layer = 0
	for i in range(Global.input_layers.size()):
		Global.input_layers[i] = null
		
	if Global.score>=30:
		_randomize_positions()
	pass

func over():
	bottom_bun_spawned = false
	Global.input_bottom_bun_spawned = false
	Global.input_topbun_spawned = false
	layer = 0
	for i in range(Global.input_layers.size()):
		Global.input_layers[i] = null
	pass

func bl_reset():
	pass

func _on_PattyButton_pressed():
	if !layer>=4&&bottom_bun_spawned&&Global.game_started:
		$Buttons/PattyButton/PATTY_AUDIO.play()
		Global.input_layers[layer] = "Patty"
		var patty = Patty_Resource.instance()
		if layer==0:
			patty.position = Vector2(225,862)
			add_child(patty)
		if layer==1:
			patty.position = Vector2(225,838)
			add_child(patty)
		if layer==2:
			patty.position = Vector2(225,814)
			add_child(patty)
		if layer==3:
			patty.position = Vector2(225,790)
			add_child(patty)
		layer += 1
	pass 


func _on_CheeseButton_pressed():
	if !layer==4&&bottom_bun_spawned&&Global.game_started:
		$VEGGIE_AUDIO.stream = load("res://SOUND_EFFECTS/SFX/VEGETABLE_CUTTING_SOUND2.wav")
		$VEGGIE_AUDIO.play()
		Global.input_layers[layer] = "Cheese"
		var cheese = Cheese_Resource.instance()
		if layer==0:
			cheese.position = Vector2(225,862)
			add_child(cheese)
		if layer==1:
			cheese.position = Vector2(225,838)
			add_child(cheese)
		if layer==2:
			cheese.position = Vector2(225,814)
			add_child(cheese)
		if layer==3:
			cheese.position = Vector2(225,790)
			add_child(cheese)
		layer += 1
	pass 


func _on_PickleButton_pressed():
	if !layer==4&&bottom_bun_spawned&&Global.game_started:
		$VEGGIE_AUDIO.stream = load("res://SOUND_EFFECTS/SFX/VEGETABLE_CUTTING_SOUND3.wav")
		$VEGGIE_AUDIO.play()
		Global.input_layers[layer] = "Pickles"
		var pickles = Pickles_Resource.instance()
		if layer==0:
			pickles.position = Vector2(225,862)
			add_child(pickles)
		if layer==1:
			pickles.position = Vector2(225,838)
			add_child(pickles)
		if layer==2:
			pickles.position = Vector2(225,814)
			add_child(pickles)
		if layer==3:
			pickles.position = Vector2(225,790)
			add_child(pickles)
		layer += 1
	pass 


func _on_TomatoButton_pressed():
	if !layer==4&&bottom_bun_spawned&&Global.game_started:
		$VEGGIE_AUDIO.stream = load("res://SOUND_EFFECTS/SFX/VEGETABLE_CUTTING_SOUND_1.wav")
		$VEGGIE_AUDIO.play()
		Global.input_layers[layer] = "Tomato"
		var tomato = Tomato_Resource.instance()
		if layer==0:
			tomato.position = Vector2(225,862)
			add_child(tomato)
		if layer==1:
			tomato.position = Vector2(225,838)
			add_child(tomato)
		if layer==2:
			tomato.position = Vector2(225,814)
			add_child(tomato)
		if layer==3:
			tomato.position = Vector2(225,790)
			add_child(tomato)
		layer += 1
	pass 


func _on_OnionButton_pressed():
	if !layer==4&&bottom_bun_spawned&&Global.game_started:
		$VEGGIE_AUDIO.stream = load("res://SOUND_EFFECTS/SFX/VEGETABLE_CUTTING_SOUND2.wav")
		$VEGGIE_AUDIO.play()
		Global.input_layers[layer] = "Onion"
		var onion = Onion_Resource.instance()
		if layer==0:
			onion.position = Vector2(225,862)
			add_child(onion)
		if layer==1:
			onion.position = Vector2(225,838)
			add_child(onion)
		if layer==2:
			onion.position = Vector2(225,814)
			add_child(onion)
		if layer==3:
			onion.position = Vector2(225,790)
			add_child(onion)
		layer += 1
	pass 


func _on_BunButton_pressed():
	if !bottom_bun_spawned&&Global.game_started:
		var bottom_bun = BottomBun_Resource.instance()
		bottom_bun.position = Vector2(215,900)
		add_child(bottom_bun)
		Global.input_bottom_bun_spawned = true
		bottom_bun_spawned = true
	else:
		if !Global.input_topbun_spawned&&Global.game_started:
			var topbun = TopBun_Resource.instance()
			topbun.position = Vector2(215,740)
			add_child(topbun)
			Global.input_topbun_spawned = true
			if !layer==4:
				Global.input_layers[layer] = "Topbun"
	$BUN_AUDIO.stream = load("res://SOUND_EFFECTS/SFX/VEGETABLE_CUTTING_SOUND_1.wav")
	$BUN_AUDIO.play()



func _randomize_positions():
	positions.shuffle()

	for i in range(buttons.size()):
		buttons[i].rect_position = positions[i]
	
	$SwitchAnimation.play("POP")
	pass

