extends CanvasLayer

var rng = RandomNumberGenerator.new()
var headline1
var headline2
var headline3
#var headline_choice: PackedScene = preload("res://path_to_scene.tscn")

@export var headline_choice: PackedScene

signal shop_closed
signal update_stats(Data)

var headlines = {
	"pink-pres": [
		{"cost": 10,
			"text": "Pink President chooses Battery Resources over Clean Drinking Oil", 
			"pink_rep": -8, 
			"blue_rep": 0, 
			"green_rep": 0, 
		}, 
		{"cost": 5, 
			"text": "Blue Robot Saves an Alpha Version from Fire!", 
			"pink_rep": 0, 
			"blue_rep": 5, 
			"green_rep": 0, 
		}
	],
	"pink-protest": [
		{"cost": 20, 
			"text": "3 Arms Lost! Pink Robots' Protest becomes Violent", 
			"pink_rep": -8, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Green Robots' Festival Opens. First 100 Robots get a Free Battery!", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": 4, 
		}
	],
	"green-virus": [
		{"cost": 15, 
			"text": "Green Robot Found with Virus...Quaratine Incoming!", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": -10, 
		},
		{"cost": 25, 
			"text": "Blue Robot Awarded Nobel Prize for Finding Anti-Virus, Millions Cured Already",
			"pink_rep": 0, 
			"blue_rep": 10, 
			"green_rep": 0, 
		}
	],
	"school": [
		{"cost": 15, 
			"text": "Internet Shut Down at Primary Schools, Alpha Versions Unable to Update", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Blues and Greens Showed Great Hospitality to Refugees, says Pink",
			"pink_rep": 1, 
			"blue_rep": 5, 
			"green_rep": 5, 
		}
	],
	"fire-battery": [
		{"cost": 15, 
			"text": "Batteries Expected to Become a Luxury after Explosions at Big Blue Factory", 
			"pink_rep": 0, 
			"blue_rep": -7, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Prices of Mechanical Parts on the Rise, Blues Hoarding Precious Ores, says Green",
			"pink_rep": 0, 
			"blue_rep": -3, 
			"green_rep": 1, 
		}
	],
	"judge": [
		{"cost": 15, 
			"text": "Defendant and Judge seen Shaking Hands after Victory", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Pink Robot Found with Broken Antenna, Authorities say to be Careful After Dark",
			"pink_rep": 2, 
			"blue_rep": 0, 
			"green_rep": 0, 
		}
	],
	"police-pVg": [
		{"cost": 15, 
			"text": "Studies Show Police Investigate Green Robot Crimes more than Pink Robots", 
			"pink_rep": 6, 
			"blue_rep": 0, 
			"green_rep": -6, 
		},
		{"cost": 25, 
			"text": "Notorious Pink Panthers Found at Last. Turns out it was all Greens to Defame Pinks.",
			"pink_rep": 5, 
			"blue_rep": 0, 
			"green_rep": -10, 
		}
	],
	"virus-blue": [
		{"cost": 15, 
			"text": "Studies Show that Blue Robots are 24% More likely to Catch a Virus", 
			"pink_rep": 0, 
			"blue_rep": -8, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "This Election, few Pinks Voted, Leading to an Unexpected Candidate Win",
			"pink_rep": -6, 
			"blue_rep": 3, 
			"green_rep": 3, 
		}
	],
	"population": [
		{"cost": 15, 
			"text": "Population Expected to Triple by XX26, Resource Allocation Becomes a Concern", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Experts find a Flaw in Anti-Virus Software, More Commonly found in Blue Robots",
			"pink_rep": 2, 
			"blue_rep": -5, 
			"green_rep": 2, 
		}
	],
	"divorcees": [
		{"cost": 15, 
			"text": "Experts say 100% of Divorcees were Married", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Green Robot Arrested after Public Indecency, says 'it was funny' ",
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": -5, 
		}
	],
	"pink-orgCrime": [
		{"cost": 15, 
			"text": "Pink Robot Caught for Assisting in a Major Crime Operation", 
			"pink_rep": -5, 
			"blue_rep": 0, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Unauthorized Parts Manufactured Illegally by Underground Blue Operative",
			"pink_rep": 0, 
			"blue_rep": -8, 
			"green_rep": 0, 
		}
	],
	"green-dis": [
		{"cost": 15, 
			"text": "Green to be Dishonorably Discharged after Hurting Innocent Civilians", 
			"pink_rep": 0, 
			"blue_rep": 0, 
			"green_rep": -5, 
		},
		{"cost": 25, 
			"text": "Green to be Honorably Discharged after Shielding Innocent Civilians from a Bomb",
			"pink_rep": 0, 
			"blue_rep": -8, 
			"green_rep": 0, 
		}
	],
	"pink-parents": [
		{"cost": 15, 
			"text": "Pink Parents Call Police on Innocent Green Teen who was just Charging His Battery", 
			"pink_rep": -10, 
			"blue_rep": 0, 
			"green_rep": 10, 
		},
		{"cost": 25, 
			"text": "3 Robots Found Dismembered, Authorities Blame the Pink Panthers",
			"pink_rep": -9, 
			"blue_rep": 0, 
			"green_rep": 0, 
		}
	],
	"blue-dead": [
		{"cost": 15, 
			"text": "Scientist Behind Renewable Battery Breakthrough Found Dead", 
			"pink_rep": 0, 
			"blue_rep": 10, 
			"green_rep": 0, 
		},
		{"cost": 25, 
			"text": "Green Mayor betrays trust of Pinks, Signing Away Land Rights to Blue Developments",
			"pink_rep": 3, 
			"blue_rep": -10, 
			"green_rep": -10, 
		}
	],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	headline_choice = load("res://scenes/game/store/headline_choice.tscn")
	
	setup()
	
func setup() -> void : 
	
	var random_items = get_random_headlines(headlines, 3)

	headline1 = $ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice
	headline2 = $ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice2
	headline3 = $ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice3

	headline1.set_headline_info(headlines[random_items[0]][0], headlines[random_items[0]][1])
	headline2.set_headline_info(headlines[random_items[1]][0], headlines[random_items[1]][1])
	headline3.set_headline_info(headlines[random_items[2]][0], headlines[random_items[2]][1])


# Function to get random items from the dictionary
func get_random_headlines(dict: Dictionary, count: int) -> Array:
	var keys = dict.keys()
	keys.shuffle()
	var random_keys = keys.slice(0, 3)
	return random_keys

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_close_shop_pressed() -> void:
	print("closey")
	unselectAll()
	emit_signal("shop_closed")


func _on_headline_choice_headline_selected(data: Variant) -> void:
	print("Headline selected:", data)
	print("send update stats")
	emit_signal("update_stats", data)


func _on_headline_choice_2_headline_selected(data: Variant) -> void:
	emit_signal("update_stats", data) # Replace with function body.


func _on_headline_choice_3_headline_selected(data: Variant) -> void:
	emit_signal("update_stats", data) # Replace with function body.

func unselectAll() -> void : 
	$ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice.unselect()
	$ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice2.unselect()
	$ColorRect/HBoxContainer/VBoxContainer/HeadlineChoice3.unselect()


func _on_texture_button_pressed() -> void:
	emit_signal("shop_closed")
