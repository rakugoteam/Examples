extends Node

const door_dialogue_path = "res://Examples/stevepixelface_dialog_system/dialogues/door.rk"

onready var dialogue_box = $GUI/TextureRect/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Rakugo.connect("say", self, "_on_say")
	
	Rakugo.parse_script(door_dialogue_path)
	
	Rakugo.execute_script("door")

func _on_say(character:Dictionary, text:String):
	dialogue_box.text = text

func _process(delta: float) -> void:
	if Rakugo.is_waiting_step() and Input.is_action_just_pressed("ui_accept"):
		Rakugo.do_step()
