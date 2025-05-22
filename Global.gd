extends Node

var JSON = JSONParseResult

signal start

var current = 1

signal RightCONT
signal bell_ringed
signal GameOver

signal _continue 

signal three_x
signal five_x


var game_started = false
var game_overed = false
var game_tempo = 6
var file = File.new()
var score = 0
var phase = 5
var current_money = 0
var money_collected = 0
var location_data = {"BurgerTown":3,"RETROdiner":1,"FoodUnit":1,"DeLightHouse":1,"SpicePit":1}

var order_bottom_bun_spawned = false
var order_topbun_spawned = false
var order_layer1 
var order_layer2
var order_layer3
var order_layer4
var order_layers = [order_layer1,order_layer2,order_layer3,order_layer4]

var input_bottom_bun_spawned = false
var input_topbun_spawned = false
var input_layer1
var input_layer2
var input_layer3
var input_layer4
var input_layers = [input_layer1,input_layer2,input_layer3,input_layer4]

func _ready():
	phase = 5
	game_tempo = 6
	score = 0

	input_bottom_bun_spawned = false
	input_topbun_spawned = false
	for i in range(input_layers.size()):
		input_layers[i] = null

	for i in range(order_layers.size()):
		order_layers[i] = null  

	load_data() 
	pass 

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("game_start"):
		game_tempo = 6
		game_started = true
		emit_signal("start")
	if Input.is_action_just_pressed("Ring_Bell_Done")&&game_started:
		if order_layers==input_layers:
			emit_signal("bell_ringed")
			score += 1
			if score==10:
				phase += 5
				game_tempo = 5
				emit_signal("three_x")
			if score==25:
				phase += 10
				game_tempo = 4
				emit_signal("five_x")
			current_money += phase
			emit_signal("RightCONT")
		else:
			game_started = false
			money_collected += current_money
			save_data()
			emit_signal("GameOver")

func save_data():
	file.open("user://saved_data.sav", File.WRITE)
	file.store_var(money_collected)
	file.store_var(location_data)
	file.store_var(current)
	file.close()

func load_data():
	if file.file_exists("user://saved_data.sav"):
		file.open("user://saved_data.sav", File.READ)
		var saved_money_collected = file.get_var()
		var saved_location_data = file.get_var()
		var saved_current = file.get_var()
		file.close()
		money_collected = saved_money_collected
		current = saved_current
		location_data = saved_location_data

