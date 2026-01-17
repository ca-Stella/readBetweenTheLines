extends VBoxContainer

var hp_change = 0
var cost = 0
var headline = ""
var cost_label
var headline_label
var original_headline_info: Dictionary = {}
var rolled_headline_info: Dictionary = {}



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
	self.hp_change = original["hp_change"]
	
	original_headline_info = original
	rolled_headline_info = rolled
	
	cost_label.text = str(self.cost)
	headline_label.text = self.headline


func _on_information_pressed() -> void:
	print("Cost: ", self.cost, ", Headline: ", self.headline, ", HP change: ", self.hp_change)


func _on_reroll_pressed() -> void:
	self.cost = rolled_headline_info["cost"]
	self.headline = rolled_headline_info["text"]
	self.hp_change = rolled_headline_info["hp_change"]
	
	cost_label.text = str(self.cost)
	headline_label.text = self.headline
