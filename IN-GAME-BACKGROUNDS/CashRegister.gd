extends Node2D


func _ready():
	if Global.current == 1:
		$Sprite.texture = load("res://FastFoodEmUp-Assets/Cash-Register.png")
	if Global.current == 2:
		$Sprite.texture = load("res://CashRegisters/ArmyCashRegister.png")
	if Global.current == 3:
		$Sprite.texture = load("res://CashRegisters/RETRO-CashRegister.png")
	if Global.current == 4:
		$Sprite.texture = load("res://CashRegisters/PresidentsCashRegister.png")
	if Global.current == 5:
		$Sprite.texture = load("res://CashRegisters/HellRegister.png")
	pass 

