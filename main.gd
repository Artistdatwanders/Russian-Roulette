extends Control

var ThugIsAlive
var DudeIsAlive
var IsBullet = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ThugIsAlive = true
	DudeIsAlive = true
	$Control/animation.play("on_thug")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	IsBullet = $Gun.bullet
	if $Gun.visible != true:
		if Input.is_action_pressed("ui_right"):
			$Thug.grab_focus()
		if Input.is_action_pressed("ui_left"):
			$Dude.grab_focus()
#func shoot_gun():
	#if bullet  true in slotx
	#	then shoot
	#else
	#	set to next slot x+1
func shoot_dude() -> void:
	if IsBullet == 1:
		DudeIsAlive = false
		Globalvariable.thug = ThugIsAlive
		$Control/animation.play("Shoot_dead")
		$"Gun shot".play()
		await $Control/animation.animation_finished
		get_tree().change_scene_to_file("res://death.tscn")
	else:
		$Control/animation.play("trigger_due")
		$Gun.next_bullet()
	
func shoot_thug() -> void:
	if IsBullet == 1:
		ThugIsAlive = false
		Globalvariable.thug = ThugIsAlive
		get_tree().change_scene_to_file("res://death.tscn")
	else:
		$Control/animation.play("trigger_thug")
		$Gun.next_bullet()
	push_error(IsBullet)

func new_game():
	$Gun.visible = true
	_ready()

func _on_dude() -> void:
	$Control/animation.play("to_Dude")
	await $Control/animation.animation_finished
	$Control/animation.play("on_dude")

func _dude_exited() -> void:
	$Control/animation.play("to_Thug")
	await $Control/animation.animation_finished
	$Control/animation.play("on_thug")
