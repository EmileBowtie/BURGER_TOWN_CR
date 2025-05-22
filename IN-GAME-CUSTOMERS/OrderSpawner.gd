extends Node2D

var function_in_process = false

var BottomBun = preload("res://IN-GAME-INGREDIENTS/BottomBun.tscn")
var Patty = preload("res://FDR-INGREDIENTS/PattyFDR.tscn")
var Cheese = preload("res://FDR-INGREDIENTS/CheeseFDR.tscn")
var Tomato = preload("res://FDR-INGREDIENTS/TomatoFDR.tscn")
var Onion = preload("res://FDR-INGREDIENTS/OnionFDR.tscn")
var Pickles = preload("res://FDR-INGREDIENTS/PicklesFDR.tscn")
var TopBun = preload("res://FDR-INGREDIENTS/TopBunFDR.tscn")

var done = false

func _ready():
	Global.connect("RightCONT",self,"clear_layers")
	Global.connect("GameOver",self,"over")
	randomize()

func over():
	clear_layers()
	Global.game_started = false



func order_creation():
	function_in_process = true
	
	var spawn_the_lid = false
	
	var bottom_bun = BottomBun.instance()
	bottom_bun.position = Vector2(237,277)
	add_child(bottom_bun)
	Global.order_bottom_bun_spawned = true
	
	for i in range(Global.order_layers.size()):
		var random_function = function_array[randi() % function_array.size()]
		random_function.call_func(i)
		if random_function.get_function() == "spawn_topbun":
			spawn_the_lid = false
			break
		else:
			spawn_the_lid = true
	
	if spawn_the_lid:
		var top_bun = TopBun.instance()
		top_bun.position = Vector2(238,125)
		add_child(top_bun)
		Global.order_topbun_spawned = true
	print("spawned order")
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "OrderCloudAppear":
		if !function_in_process:
			order_creation()
	pass

func spawn_patty(layer_index):
	Global.order_layers[layer_index] = "Patty"
	var patty = Patty.instance()
	if layer_index == 0:
		patty.position = Vector2(248,241)
	if layer_index == 1:
		patty.position = Vector2(236,220)
	if layer_index == 2:
		patty.position = Vector2(246,200)
	if layer_index == 3:
		patty.position = Vector2(246,180)
	add_child(patty)
	return
	pass

func spawn_topbun(layer_index):
	Global.order_layers[layer_index] = "Topbun"
	var bun = TopBun.instance()
	if layer_index == 0:
		bun.position = Vector2(236,209)
	if layer_index == 1:
		bun.position = Vector2(236,187)
	if layer_index == 2:
		bun.position = Vector2(236,167)
	if layer_index == 3:
		bun.position = Vector2(236,147)
	add_child(bun)

func spawn_cheese(layer_index):
	Global.order_layers[layer_index] = "Cheese"
	var cheese = Cheese.instance()
	if layer_index == 0:
		cheese.position = Vector2(248,241)
	if layer_index == 1:
		cheese.position = Vector2(236,220)
	if layer_index == 2:
		cheese.position = Vector2(246,200)
	if layer_index == 3:
		cheese.position = Vector2(246,180)
	add_child(cheese)
	return
	pass

func spawn_tomato(layer_index):
	Global.order_layers[layer_index] = "Tomato"
	var tomato = Tomato.instance()
	if layer_index == 0:
		tomato.position = Vector2(248,241)
	if layer_index == 1:
		tomato.position = Vector2(236,220)
	if layer_index == 2:
		tomato.position = Vector2(246,200)
	if layer_index == 3:
		tomato.position = Vector2(246,180)
	add_child(tomato)
	return
	pass

func spawn_onion(layer_index):
	Global.order_layers[layer_index] = "Onion"
	var onion = Onion.instance()
	if layer_index == 0:
		onion.position = Vector2(248,241)
	if layer_index == 1:
		onion.position = Vector2(236,220)
	if layer_index == 2:
		onion.position = Vector2(246,200)
	if layer_index == 3:
		onion.position = Vector2(246,180)
	add_child(onion)
	return
	pass

func spawn_pickles(layer_index):
	Global.order_layers[layer_index] = "Pickles"
	var pickles = Pickles.instance()
	if layer_index == 0:
		pickles.position = Vector2(248,241)
	if layer_index == 1:
		pickles.position = Vector2(236,220)
	if layer_index == 2:
		pickles.position = Vector2(246,200)
	if layer_index == 3:
		pickles.position = Vector2(246,180)
	add_child(pickles)
	return
	pass

var function_array = [
	funcref(self, "spawn_patty"),
	funcref(self, "spawn_cheese"),
	funcref(self, "spawn_tomato"),
	funcref(self, "spawn_onion"),
	funcref(self, "spawn_pickles"),
	funcref(self,"spawn_topbun")
	]

func clear_layers():
	for i in range(Global.order_layers.size()):
		Global.order_layers[i] = null  
		function_in_process = false
