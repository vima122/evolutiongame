extends KinematicBody2D
var cod = [9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9]
var napr = 0
var eat = 25
var i = 0
var sun = preload("res://pfoto2.png")
var voidd = preload("res://eat.png")
var men = preload("res://meniral1.png")
var menn = preload("res://meniral2.png")
var a = load("res://bot.tscn")
var colid = {"r1":false,"r2":false,"r3":false,"r4":false,"r5":false,"r6":false,"r7":false,"r8":false}
var emer = 0
func _on_Timer_timeout():
	if i >= len(cod):i = 0
	if cod[i] == 1 and colid["r1"]:position = $p1.global_position
	if cod[i] == 2 and colid["r2"]:position = $p2.global_position
	if cod[i] == 3 and colid["r3"]:position = $p3.global_position
	if cod[i] == 4 and colid["r4"]:position = $p4.global_position
	if cod[i] == 5 and colid["r5"]:position = $p5.global_position
	if cod[i] == 6 and colid["r6"]:position = $p6.global_position
	if cod[i] == 7 and colid["r7"]:position = $p7.global_position
	if cod[i] == 8 and colid["r8"]:position = $p8.global_position
	if cod[i] == 9:
		if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 3:eat += 4
		if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 2:eat += 0
		else:eat += 2
	if cod[i] == 10 and eat >= 50 and colid["r1"]:potomoc($p1.global_position)
	if cod[i] == 11 and eat >= 50 and colid["r2"]:potomoc($p2.global_position)
	if cod[i] == 12 and eat >= 50 and colid["r3"]:potomoc($p3.global_position)
	if cod[i] == 13 and eat >= 50 and colid["r4"]:potomoc($p4.global_position)
	if cod[i] == 14 and eat >= 50 and colid["r5"]:potomoc($p5.global_position)
	if cod[i] == 15 and eat >= 50 and colid["r6"]:potomoc($p6.global_position)
	if cod[i] == 16 and eat >= 50 and colid["r7"]:potomoc($p7.global_position)
	if cod[i] == 17 and eat >= 50 and colid["r8"]:potomoc($p8.global_position)
	if cod[i] == 18:amam(1)
	if cod[i] == 19:amam(2)
	if cod[i] == 20:amam(3)
	if cod[i] == 21:amam(4)
	if cod[i] == 22:amam(5)
	if cod[i] == 23:amam(6)
	if cod[i] == 24:amam(7)
	if cod[i] == 25:amam(8)
	if cod[i] == 26:eat += emer*2
	for j in 7:
		if cod[i] == 18 + j:$Label.modulate = Color(1,0,0)
	if cod[i] == 26:$Label.modulate = Color(0,0,1)
	if cod[i] == 9:$Label.modulate = Color(0,1,0)
	if eat > 999:queue_free()
	i += 1
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 1:emer += 1
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 2:emer += 2
	if eat >= 50 and randi() % 10 == 5:
		var r = randi() % 8
		if r == 0 and colid["r1"]:potomoc($p1.global_position)
		if r == 1 and colid["r2"]:potomoc($p2.global_position)
		if r == 2 and colid["r3"]:potomoc($p3.global_position)
		if r == 3 and colid["r4"]:potomoc($p4.global_position)
		if r == 4 and colid["r5"]:potomoc($p5.global_position)
		if r == 5 and colid["r6"]:potomoc($p6.global_position)
		if r == 6 and colid["r7"]:potomoc($p7.global_position)
		if r == 7 and colid["r8"]:potomoc($p8.global_position)
	eat -= 1
func _process(delta):
	if eat <= 0:queue_free()
	if emer >= 100:queue_free()
	colid["r1"] = !$r1.is_colliding()
	colid["r2"] = !$r2.is_colliding()
	colid["r3"] = !$r3.is_colliding()
	colid["r4"] = !$r4.is_colliding()
	colid["r5"] = !$r5.is_colliding()
	colid["r6"] = !$r6.is_colliding()
	colid["r7"] = !$r7.is_colliding()
	colid["r8"] = !$r8.is_colliding()
	$Label.text = str(eat)
func potomoc(var pos):
	var aa = a.instance()
	aa.position = pos
	aa.eat = 25
	aa.get_child(0).texture = $Sprite.texture
	if randi() % 4 == 3:
		aa.cod = cod
		aa.cod[randi() % 25] = int(rand_range(0,27))
	else:aa.cod = cod
	get_parent().add_child(aa)
	eat -= 25
func _on_Button_pressed():
	$"../../Panel/Sprite".texture = $Sprite.texture
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == -1:$"../../Panel/Sprite2".texture = voidd
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 3:$"../../Panel/Sprite2".texture = sun
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 1:$"../../Panel/Sprite2".texture = men
	if $"../../tet".get_cellv($"../../tet".world_to_map(position)) == 2:$"../../Panel/Sprite2".texture = menn
	$"../../Panel".visible = true
	var tet = ""
	for m in 25:
		tet += str(cod[m]) + ", "
		if m == 4 or m == 9 or m == 14 or m == 19:tet += "\n"
	$"../../Panel/Label2".text = "энергия:" + str(eat)
	$"../../Panel/Label3".text = "менералы:" + str(emer)
	$"../../Panel/Label".text = tet
	get_tree().paused = true
func amam(var nap):
	if nap == 1:
		var a = $r1.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 2:
		var a = $r2.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 3:
		var a = $r3.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 4:
		var a = $r4.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 5:
		var a = $r5.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 6:
		var a = $r6.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 7:
		var a = $r7.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += 10
				a.eat -= 10
			else:
				eat += int(a.eat / 2)
				a.queue_free()
	if nap == 8:
		var a = $r8.get_collider()
		if a is Object and a != null and a is KinematicBody2D:
			if a.emer >= 5:
				eat += int(a.eat / 2)
				a.eat -= int(a.eat / 2)
			else:
				eat += int(a.eat / 2)
				a.queue_free()
