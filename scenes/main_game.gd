extends Node

var store_scene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	store_scene = $Store


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	



func _on_store_shop_closed() -> void:
	store_scene.visible = false


func _on_headline_choice_headline_selected(data: Variant) -> void:
	print("select select update update")

func _on_button_pressed() -> void:
	store_scene.visible = true
	$World/StatsScene/VBoxContainer/Button.disabled=true



func _on_close_shop_pressed() -> void:
	$World/StatsScene/VBoxContainer/Button.disabled=false

func _on_store_update_stats(data: Variant) -> void:
	print("Updating values with", data["blue_rep"], data["green_rep"], data["pink_rep"])
	$World/StatsScene/VBoxContainer/VBoxContainer/Blue.value += data["blue_rep"]
	$World/StatsScene/VBoxContainer/VBoxContainer/Green.value += data["green_rep"]
	$World/StatsScene/VBoxContainer/VBoxContainer/Pink.value += data["pink_rep"]
	var a = $World/StatsScene/VBoxContainer/HBoxContainer/Money.text
	
	var money = int(a) + data["cost"]
	
	var blue = $World/StatsScene/VBoxContainer/VBoxContainer/Blue.value
	var green = $World/StatsScene/VBoxContainer/VBoxContainer/Green.value
	var pink = $World/StatsScene/VBoxContainer/VBoxContainer/Pink.value
	
	$World/StatsScene/VBoxContainer2/ChaosBar.value = (blue + green + pink)/3
	
	var value = $World/StatsScene/VBoxContainer2/ChaosBar.value
	
	$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
	if (value == 0):
		$GameOverScreen/TextureRect/Game_State.set_text("Everything was in Chaos!!! You lost!!!")
		get_tree().change_scene_to_file("res://scenes/ui/game_over_scene/game_over_screen.tscn")
		print("Everything went to shi")
	
	if (value == 100):
		$GameOverScreen/TextureRect/Game_State.set_text("You Won!!! World Peace Achieved!!!")
		get_tree().change_scene_to_file("res://scenes/ui/game_over_scene/game_over_screen.tscn")
		print("You won, world peace achieved")
	
	


func _on_g_news_button_pressed() -> void:
	var price = int($World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/GoldNewsPrice.text)
	
	var money = int($World/StatsScene/VBoxContainer/HBoxContainer/Money.text)
	
	if (int(money) >= int(price)):
		money -= price
		$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
		$World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/GNewsButton.disabled = true
		


func _on_boba_button_pressed() -> void:
	var price = int($World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/BobaPrice.text)
	
	var money = int($World/StatsScene/VBoxContainer/HBoxContainer/Money.text)
	
	if (int(money) >= int(price)):
		money -= price
		$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
		$World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/BobaButton.disabled = true


func _on_school_button_pressed() -> void:
	var price = int($World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/SchoolPrice.text)
	
	var money = int($World/StatsScene/VBoxContainer/HBoxContainer/Money.text)
	
	if (int(money) >= int(price)):
		money -= price
		$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
		$World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/SchoolButton.disabled = true


func _on_park_button_pressed() -> void:
	var price = int($World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/ParkPrice.text)
	
	var money = int($World/StatsScene/VBoxContainer/HBoxContainer/Money.text)
	
	if (int(money) >= int(price)):
		money -= price
		$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
		$World/StatsScene/VBoxContainer/VBoxContainer2/TextureRect/Control/ParkButton.disabled = true
