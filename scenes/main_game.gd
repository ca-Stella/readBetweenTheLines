extends Node

var store_scene

var blue
var green
var pink 
var blue_robots = []
var pink_robots = []
var green_robots = []
var low_rep = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	store_scene = $Store
	blue = 50
	green = 50
	pink = 50
	
	$Timer.start()
	$Timer.wait_time = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if blue < 25 or green < 25 or pink < 25:
		low_rep = true
	else:
		low_rep = false	

func _on_store_shop_closed() -> void:
	store_scene.visible = false


func _on_headline_choice_headline_selected(data: Variant) -> void:
	print("select select update update")



func _on_button_pressed() -> void:
	store_scene.setup()
	store_scene.visible = true
	$World/StatsScene/VBoxContainer/Button.disabled=true



func _on_close_shop_pressed() -> void:
	$World/StatsScene/VBoxContainer/Button.disabled=false

func _on_store_update_stats(data: Variant) -> void:
	print("Updating values with", data["blue_rep"], data["green_rep"], data["pink_rep"])
	
	blue += data["blue_rep"]
	$World/StatsScene/VBoxContainer/VBoxContainer/Blue.value = blue
	
	green += data["green_rep"]
	$World/StatsScene/VBoxContainer/VBoxContainer/Green.value = green
	
	pink += data["pink_rep"]
	$World/StatsScene/VBoxContainer/VBoxContainer/Pink.value = pink
	
	var a = $World/StatsScene/VBoxContainer/HBoxContainer/Money.text
	
	var money = int(a) + data["cost"]
	
	blue = $World/StatsScene/VBoxContainer/VBoxContainer/Blue.value
	green = $World/StatsScene/VBoxContainer/VBoxContainer/Green.value
	pink = $World/StatsScene/VBoxContainer/VBoxContainer/Pink.value
	
	$World/StatsScene/VBoxContainer2/ChaosBar.value = (blue + green + pink)/3
	
	var value = $World/StatsScene/VBoxContainer2/ChaosBar.value
	
	$World/StatsScene/VBoxContainer/HBoxContainer/Money.set_text(str(money))
	
	if (value == 0):
		$GameOverScreenLoss.visible = true
		$GameOverScreenLoss/TextureRect/Game_State.set_text("Everything was in Chaos!!! You lost!!!")
		print("Everything went to shi")
	
	if (value == 100):
		$GameOverScreenWin.visible = true
		$GameOverScreenWin/TextureRect/Game_State.set_text("You Won!!! World Peace Achieved!!!")
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


func _on_start_pressed() -> void:
	print("start pressed")
	$StartScreen.visible = false
	$World.visible = true


func _on_back_pressed() -> void:
	$StartScreen.visible = true
func _on_timer_timeout() -> void:
	if low_rep == true:
		var low_reps = []
		if blue < 25:
			low_reps.append("blue")
		if green < 25:
			low_reps.append("green")
		if pink < 25:
			low_reps.append("pink")
		var colour = low_reps.pick_random()
		var r = null
		if colour == "blue":
			var l = pink_robots + green_robots
			r = l.pick_random()
			colour = "Blue"
		elif colour == "green":
			var l = pink_robots + blue_robots
			r = l.pick_random()
			colour = "Green"
		else:
			var l = blue_robots + green_robots
			r = l.pick_random()
			colour = "Pink"
		r.get_node("Speech Bubble").show_bubble(colour)
