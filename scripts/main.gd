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
	
func _process(delta: float) -> void:
	pass




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


func _on_line_edit_text_submitted(new_text: String) -> void:
	pass # Replace with function body.
