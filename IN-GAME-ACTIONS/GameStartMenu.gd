extends Node2D



func _ready():
	if Global.current == 1:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/BurgerTownLogo.png")
	if Global.current == 2:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/FoodUnitLogo.png")
	if Global.current == 3:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/RETRODinerLogo.png")
	if Global.current == 4:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/PresidentsLogo.png")
	if Global.current == 5:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/SpicePIT-Logo.png")
	visible = true
	pass

# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("game_start"):
		Global.emit_signal("start")
		Global.game_started = true
		visible = false

