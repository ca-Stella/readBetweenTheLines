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


func _on_store_update_stats(data: Variant) -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	store_scene.setup()
	store_scene.visible = true
	$World/StatsScene/VBoxContainer/Button.disabled=true



func _on_close_shop_pressed() -> void:
	$World/StatsScene/VBoxContainer/Button.disabled=false
	$Store.unselectAll()
