extends TextureProgressBar

#@export var player : Player
#or 
#@export var world : World

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#player.healthChanged.connect(update)
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update():
	pass
	#TODO once we have player object
	#player/world health percentage of max health
	# value = world.currentHealth * 100 / world.maxHealth
