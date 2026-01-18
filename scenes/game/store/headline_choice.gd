extends VBoxContainer

var pink_rep = 0.0
var blue_rep = 0.0
var green_rep = 0.0
var cost = 0
var headline = ""

var cost_label
var headline_label
var original_headline_info: Dictionary = {}
var rolled_headline_info: Dictionary = {}



signal headline_selected(data)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	cost_label = $Information/CostLabel
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
	
	cost_label.text = str(self.cost)
	headline_label.text = self.headline


func _on_information_pressed() -> void:
	print("Cost: ", self.cost, ", Headline: ", self.headline, ", ", self.pink_rep, ", ", self.blue_rep, ", ", self.green_rep)
	emit_signal("headline_selected", {
		"cost": cost,
		"headline": headline,
		"pink_rep": pink_rep, 
		"blue_rep": blue_rep, 
		"green_rep": green_rep, 
	})
	
	
func _on_reroll_pressed() -> void:
	self.cost = rolled_headline_info["cost"]
	self.headline = rolled_headline_info["text"]
	self.pink_rep = rolled_headline_info["pink_rep"]
	self.blue_rep = rolled_headline_info["blue_rep"]
	self.green_rep = rolled_headline_info["green_rep"]
		
	cost_label.text = str(self.cost)
	headline_label.text = self.headline
