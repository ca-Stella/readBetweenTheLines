extends HBoxContainer

var pink_rep = 0.0
var blue_rep = 0.0
var green_rep = 0.0
var cost = 0
var headline = ""

var cost_label:Label
var headline_label:Label
var original_headline_info: Dictionary = {}
var rolled_headline_info: Dictionary = {}



signal headline_selected(data)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	cost_label = $Information/HBoxContainer/CostLabel
	headline_label = $Information/HeadlineLabel
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_headline_info(original: Dictionary, rolled: Dictionary) -> void:
	self.cost = original["cost"]
	self.headline = original["text"]
	self.pink_rep = original["pink_rep"]
	self.blue_rep = original["blue_rep"]
	self.green_rep = original["green_rep"]
	

	original_headline_info = original
	rolled_headline_info = rolled
	
	update_scene()



func _on_information_pressed() -> void:
	print("Cost: ", self.cost, ", Headline: ", self.headline, ", ", self.pink_rep, ", ", self.blue_rep, ", ", self.green_rep)
	emit_signal("headline_selected", {
		"cost": self.cost,
		"headline": self.headline,
		"pink_rep": self.pink_rep, 
		"blue_rep": self.blue_rep, 
		"green_rep": self.green_rep, 
	})
	
	
func _on_reroll_pressed() -> void:
	self.cost = rolled_headline_info["cost"]
	self.headline = rolled_headline_info["text"]
	self.pink_rep = rolled_headline_info["pink_rep"]
	self.blue_rep = rolled_headline_info["blue_rep"]
	self.green_rep = rolled_headline_info["green_rep"]
	update_scene()

		
func update_scene() -> void: 
	$Information/HBoxContainer/CostLabel.text = str(self.cost)
	$Information/HeadlineLabel.text = str(self.headline)

func unselect() -> void : 
	$Information.button_pressed = false
	$Reroll.button_pressed = false

func disable() -> void : 
	$Information.disabled = true
	$Reroll.disabled = true

func enable() -> void: 
	$Information.disabled = false
	$Reroll.disabled = false
