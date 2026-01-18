extends Control
#TODO THIS WILL HAVE TO BE UNDER LIKE PLAYER OR WORLD script IDK

signal healthChanged
#func hurtByHeadline(headline):
	#currentHealth -= (math depending how impactful headline was)
	
	#if currentHealth < 0:
		#GAME OVER
		
	#signal health has changed
	#healthChanged.emit()
	
#func healedByHeadline(headline):
	#currentHealth += (math depending how impactful headline was)

	#if currentHealth > maxHealth:
		#currentHealth = maxHealth
	
	#signal health has changed
	#healthChanged.emit()

#max health the world has in a run
#TODO change depending how stats variables are taken into effect
@export var maxHealth = 100
#will keep track of health as user loses it
@onready var currentHealth: int = maxHealth


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
