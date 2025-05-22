extends Node2D

var burger_town_coordinates = 0
var army_coordinates = -711
var retro_coordinates = -1417
var white_house_coordinates = -2233
var inferno_coordinates = -3898

var price 

var current_index = 0
var coordinates = [burger_town_coordinates,army_coordinates,retro_coordinates,white_house_coordinates,inferno_coordinates]

func _ready():
	$MoneyCollectedLabel.visible = false
	Global.load_data()
	$BackgroundSidewalks.position.x = coordinates[current_index]
	pass # Replace with function body.

func _process(delta):
	if current_index==0:
		match Global.location_data["BurgerTown"]:
			3:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = true
			2:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = true
				$Buttons/EquippedButton.visible = false
	if current_index==1:
		match Global.location_data["FoodUnit"]:
			3:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = true
			2:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = true
				$Buttons/EquippedButton.visible = false
			1:
				price = 250
				$Buttons/BuyButton/PriceLabel.text = "250$"
				$Buttons/BuyButton.visible = true
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = false
	if current_index==2:
		match Global.location_data["RETROdiner"]:
			3:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = true
			2:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = true
				$Buttons/EquippedButton.visible = false
			1:
				price = 350
				$Buttons/BuyButton/PriceLabel.text =  "350$"
				$Buttons/BuyButton.visible = true
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = false
	if current_index==3:
		match Global.location_data["DeLightHouse"]:
			3:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = true
			2:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = true
				$Buttons/EquippedButton.visible = false
			1:
				price = 450
				$Buttons/BuyButton/PriceLabel.text =  "450$"
				$Buttons/BuyButton.visible = true
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = false
	if current_index==4:
		match Global.location_data["SpicePit"]:
			3:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = true
			2:
				$Buttons/BuyButton.visible = false
				$Buttons/EquipButton.visible = true
				$Buttons/EquippedButton.visible = false
			1:
				price = 600
				$Buttons/BuyButton/PriceLabel.text = "600$"
				$Buttons/BuyButton.visible = true
				$Buttons/EquipButton.visible = false
				$Buttons/EquippedButton.visible = false
	pass

func _physics_process(delta):
	pass

func _on_RightScrollButton_pressed():
	if current_index < coordinates.size() - 1:
		$Operators/SCROLL_BUTTONS_PLAYER.play()
		current_index += 1
		$Tween.interpolate_property(
			$BackgroundSidewalks, 
			"position:x", 
			$BackgroundSidewalks.position.x, 
			coordinates[current_index], 
			0.3, 
			Tween.TRANS_CUBIC, 
			Tween.EASE_IN_OUT
		)
		$Tween.start()

func _on_LeftScrollButton_pressed():
	if current_index > 0:
		$Operators/SCROLL_BUTTONS_PLAYER.play()
		current_index -= 1
		$Tween.interpolate_property(
			$BackgroundSidewalks, 
			"position:x", 
			$BackgroundSidewalks.position.x, 
			coordinates[current_index], 
			0.3, 
			Tween.TRANS_CUBIC, 
			Tween.EASE_IN_OUT
		)
		$Tween.start()


func _on_BuyButton_pressed():
	$Operators/SCROLL_BUTTONS_PLAYER.play()
	$Buttons/AreYouSureWindow/AnimationPlayer.play("POP_UP")


func _on_EquippedButton_pressed():
	pass

func _on_EquipButton_pressed():
	$Buttons/EQUIP_SOUND_PLAYER.play()
	if current_index==0:
		for key in Global.location_data.keys():
			if Global.location_data[key]==3:
				Global.location_data[key] = 2

		Global.location_data["BurgerTown"] = 3
		Global.current = 1
		Global.save_data() 
		Global.load_data()
	if current_index==1:
		for key in Global.location_data.keys():
			if Global.location_data[key]==3:
				Global.location_data[key] = 2

		Global.location_data["FoodUnit"] = 3
		Global.current = 2
		Global.save_data()
		Global.load_data()
	if current_index==2:
		for key in Global.location_data.keys():
			if Global.location_data[key]==3:
				Global.location_data[key] = 2

		Global.location_data["RETROdiner"] = 3
		Global.current = 3
		Global.save_data()
		Global.load_data()
	if current_index==3:
		for key in Global.location_data.keys():
			if Global.location_data[key]==3:
				Global.location_data[key] = 2

		Global.location_data["DeLightHouse"] = 3
		Global.current = 4
		Global.save_data()
		Global.load_data()
	if current_index==4:
		for key in Global.location_data.keys():
			if Global.location_data[key]==3:
				Global.location_data[key] = 2

		Global.location_data["SpicePit"] = 3
		Global.current = 5
		Global.save_data()
		Global.load_data()


func _on_Yes_pressed():
	if Global.money_collected>=price:
		Global.money_collected - price
		$Buttons/BOUGHT_SOUND_PLAYER.play()
		if current_index==1:
			Global.location_data["FoodUnit"] = 2
			Global.money_collected -= price
			Global.save_data()
			Global.load_data()
		if current_index==2:
			Global.location_data["RETROdiner"] = 2
			Global.money_collected -= price
			Global.save_data()
			Global.load_data()
		if current_index==3:
			Global.location_data["DeLightHouse"] = 2
			Global.money_collected -= price
			Global.save_data()
			Global.load_data()
		if current_index==4:
			Global.location_data["SpicePit"] = 2
			Global.money_collected -= price
			Global.save_data()
			Global.load_data()
		$Buttons/AreYouSureWindow/AnimationPlayer.play("POP_OUT")
	else:
		$Buttons/AreYouSureWindow/AnimationPlayer.play("POP_OUT")
		$Buttons/NOT_ENOUGH_MONEY/AnimationPlayer.play("POP_IN")
		pass


func _on_No_pressed():
	$Operators/SCROLL_BUTTONS_PLAYER.play()
	$Buttons/AreYouSureWindow/AnimationPlayer.play("POP_OUT")


func _on_TextureButton_pressed():
	$AMBIENT_PLAYER.stop()
	$BUTTON_SOUND_PLAYER.play()
	$LOADING_SCREEN/AnimationPlayer.play("FADE_OUT")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "FADE_IN":
		$MoneyCollectedLabel.visible = true
	if anim_name == "FADE_OUT":
		get_tree().change_scene("res://IN-GAME-SCENES/Main.tscn")
