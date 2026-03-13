extends Control

var bullet

var arr = Array([1, 2, 3, 4, 5, 6], TYPE_INT,"",null)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$buttons/Slot1.grab_focus()
	_insert_bullet()

func _insert_bullet():
	bullet = arr.pick_random()

func next_bullet():
	$"Gun Miss".play()
	if bullet == 6:
		bullet = 1
	else:
		bullet += 1
	#randf from slot range
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_pressed() -> void:
	$buttons.visible = false
	$"Gun Miss".play()
	$AnimationPlayer.play("slideOut")
	await $AnimationPlayer.animation_finished
	$".".visible = false
