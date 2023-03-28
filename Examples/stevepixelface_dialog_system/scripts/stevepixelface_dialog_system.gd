extends Node

const world_dialogue_path = "res://Examples/stevepixelface_dialog_system/dialogues/world_dialog.rk"
const world_dialogue_name = "world_dialog"

@onready var dialogue_box = $GUI/TextureRect
@onready var dialogue_box_label = $GUI/TextureRect/Label

@onready var player = $Player
@onready var player_area = $Player/Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Rakugo.connect("sg_say", Callable(self, "_on_say"))
	Rakugo.connect("sg_execute_script_finished", Callable(self, "_on_execute_script_finished"))
	
	Rakugo.parse_script(world_dialogue_path)

func _on_say(character:Dictionary, text:String):
	dialogue_box_label.text = text
	
func _on_execute_script_finished(script_name:String, error_string:String):
	dialogue_box.visible = false
	player.set_physics_process(true)

	if error_string != "":
		push_error(error_string)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if Rakugo.is_waiting_step():
			Rakugo.do_step()
		else:
			for area in player_area.get_overlapping_areas():
				player.set_physics_process(false)
				Rakugo.execute_script(world_dialogue_name, area.name)
				dialogue_box_label.text = ""
				dialogue_box.visible = true
				break
