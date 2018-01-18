extends Node

# Check entered status
var is_entered
var is_interacting

# JSON Loading
var events

func _ready():
	is_entered = false
	is_interacting = false
	
func load_event(event_name):
	# Prepare new file
	var file = File.new()
	# Load file into variable
	file.open("res://scripts/JSON/Events.json", file.READ)
	# Parse file as text into dictionary variable
	events = JSON.parse(file.get_as_text())
	# iterate through all events in dictionary
	for i in events.result["Events"]:
		# If the given name exists
		if (i["name"] == event_name):
			# Print out event message
			print(i["message"])
		if (i.has("scene change")):
			get_node("/root/scene_manager").goto_scene("res://scenes/" + i["scene change"] + ".tscn")
	# Close opened file from memory
	file.close()