extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()
	if Globalvariable.thug == true:
		$thug.visible = false
		$dude.visible = true
	else:
		$thug.visible = true
		$dude.visible = false
		$"thug/Gun shot".play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
