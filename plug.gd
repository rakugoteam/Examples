extends "res://addons/gd-plug/plug.gd"

func _plugging():
    # Declare your plugins in here with plug(src, args)
    # By default, only "addons/" directory will be installed
    plug("rakugoteam/Emojis-For-Godot", {"include": [".import/"]})
    plug("rakugoteam/Godot-Material-Icons", {"include": [".import/"]})
    plug("rakugoteam/AdvancedText")
    plug("rakugoteam/Rakugo")
