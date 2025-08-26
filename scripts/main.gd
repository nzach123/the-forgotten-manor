extends Control
class_name Main

@onready var game_text: RichTextLabel = $Background/MarginContainer/Rows/GameText
@onready var line_edit: LineEdit = $Background/MarginContainer/Rows/PanelContainer/LineEdit

var direction = []
var vowels = ["a", "e", "i", "o", "u"]
var msg = ""

var rooms: Dictionary
var items: Dictionary
var player: Dictionary = {
	"location": "Awakening Chamber",
	"inventory": []
}

func _ready() -> void:
	# This function is called when the node enters the scene tree for the first time.
	load_game_data()
	display_welcome_message()
	display_room_info()
	line_edit.grab_focus() # So the player can start typing immediately.
	line_edit.text_submitted.connect(_on_line_edit_text_submitted)
	
func process_command(command: String) -> void:
	var parts = command.strip_edges().to_lower().split(" ")
	var action = parts[0]
	var target = ""
	if parts.size() > 1:
		target = parts[1]

	match action:
		"go":
			do_go(target)
		"get":
			do_get(target)
		"look":
			display_room_info()
		_:
			add_text("Invalid command.")

	# After processing the command, display the new room info
	display_room_info()

func do_go(direction: String) -> void:
	var current_room_name: String = player.location
	var current_room: Dictionary = rooms[current_room_name]

	var capitalized_direction = direction.capitalize()
	if current_room.has(capitalized_direction):
		var next_room_name = current_room[capitalized_direction]
		player.location = next_room_name
	else:
		add_text("You can't go that way.")
		
func do_get(item_name: String) -> void:
	var current_room_name: String = player.location
	var current_room: Dictionary = rooms[current_room_name]

	if current_room.has("Item") and item_name.to_lower() == current_room.Item.to_lower():
		var item_to_get = current_room.Item
		if not player.inventory.has(item_to_get):
			player.inventory.append(item_to_get)
			current_room.erase("Item") # Remove the item from the room
			add_text("You picked up the %s." % item_to_get)
		else:
			add_text("You already have the %s." % item_to_get)
	else:
		add_text("You can't get '%s'." % item_name)

func add_text(text: String) -> void:
	game_text.append_text(text + "\n")

func display_welcome_message() -> void:
	add_text("Welcome to The Forgotten Manor"+'\n')
	add_text("Find the three rings of the fallen knights to unlock the secrets of the manor and find your escape.")

func display_room_info() -> void:
	var current_room_name: String = player.location
	var current_room: Dictionary = rooms[current_room_name]
	
	add_text("\n--------------------")
	add_text("You are in the " + current_room_name + '\n')
	
	if player.inventory.size() > 0:
		add_text("Inventory: " + ", ".join(player.inventory) + '\n')
	else:
		add_text("Inventory: Empty" + '\n')

	add_text(current_room.Description + "\n")

	if current_room.has("Item"):
		add_text("You see a " + current_room.Item + '\n')


func load_game_data() -> void:
	var rooms_file = FileAccess.open("res://assets/rooms.json", FileAccess.READ)
	var items_file = FileAccess.open("res://assets/items.json", FileAccess.READ)

	rooms = JSON.parse_string(rooms_file.get_as_text())
	items = JSON.parse_string(items_file.get_as_text())

	rooms_file.close()
	items_file.close()



func _on_line_edit_text_submitted(input_text: String) -> void:
	add_text("> " + input_text)
	process_command(input_text)
	line_edit.clear() # Clear the input field for the next command.
