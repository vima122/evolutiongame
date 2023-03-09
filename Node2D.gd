extends Node2D
var col = 0
var time = 0
var god = 0
var leto = [3,3,3,-1,-1,1,1,1,2,2,2,1,1,1,-1,-1,3,3,3]
var osen = [3,3,-1,-1,1,1,1,1,2,2,2,1,1,1,1,-1,-1,3,3]
var zima = [3,-1,-1,-1,-1,-1,-1,1,1,2,1,1,-1,-1,-1,-1,-1,-1,3]
var vesn = [3,3,-1,-1,-1,-1,1,1,2,2,2,1,1,-1,-1,-1,-1,3,3]
func _ready():
	randomize()
	OS.window_resizable = false
	$tim/KinematicBody2D2/Sprite.texture = load("res://icon2.png")
	$tim/KinematicBody2D3/Sprite.texture = load("res://icon3.png")
	$tim/KinematicBody2D4/Sprite.texture = load("res://icon4.png")
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$Panel2.visible = true
		get_tree().paused = true
func _on_Timer_timeout():
	col = 0
	for i in get_node("tim").get_child_count():
		if "KinematicBody2D" in get_node("tim").get_child(i).name:
			col += 1
	if col >= 1 and col <= 3:
		for i in get_node("tim").get_child_count():
			if "KinematicBody2D" in get_node("tim").get_child(i).name:
				if get_node("tim").get_child(i).eat == 1:print(get_node("tim").get_child(i).cod)
	if col == 0:
		print(time)
		get_tree().quit()
func _on_Timer2_timeout():
	time += 1
	if time % 60 == 0:
		god += 1
		if god >= 4:
			god = 0
		for r in 32:
			for t in 18:
				if god == 0:
					$tet.set_cellv(Vector2(r,t),leto[t])
				if god == 1:
					$tet.set_cellv(Vector2(r,t),osen[t])
				if god == 2:
					$tet.set_cellv(Vector2(r,t),zima[t])
				if god == 3:
					$tet.set_cellv(Vector2(r,t),vesn[t])
func _on_Button_pressed():
	$Panel.visible = false
	get_tree().paused = false
func _on_Button2_pressed():
	$Panel2.visible = false
	for i in get_node("tim").get_child_count():
		if "KinematicBody2D" in get_node("tim").get_child(i).name:
			get_node("tim").get_child(i).get_node("Timer").wait_time = $Panel2/SpinBox.value
	get_tree().paused = false
