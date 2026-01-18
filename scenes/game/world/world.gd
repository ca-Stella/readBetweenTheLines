extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_headline_selected(data):
	$VBoxContainer/a.text = str(data["cost"], " & ", data["headline"], ", ", data["pink_rep"])
	print("received")
		#emit_signal("headline_selected", {
		#"cost": cost,
		#"headline": headline,
		#"pink_rep": pink_rep, 
		#"blue_rep": blue_rep, 
		#"green_rep": green_rep, 
	#})
