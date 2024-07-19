extends Control

var B_object
var update
var default
var variable_name : String
func _setup(node, variable : String, icon = null, Text = "", updateobj = null, _default = Vector3(0,0,0)):
	update = updateobj
	default = _default
	$c/title/Control/c/icon.icon = icon
	B_object = node
	variable_name = variable
	$c/title/Control/c/ScrollContainer/name.text = Text

func _update():
	if B_object == null: return
	$c/main/VBoxContainer/x/x.value = B_object.get(variable_name).x
	$c/main/VBoxContainer/y/y.value = B_object.get(variable_name).y
	$c/main/VBoxContainer/z/z.value = B_object.get(variable_name).z
	pass

var old
func _process(_delta):
	if not is_instance_valid(B_object): return
	if B_object.get(variable_name) != old:
		_update()
		pass
	old = B_object.get(variable_name)
	pass

func _on_x_on_value_changed(value):
	if B_object == null: return
	var a = B_object.get(variable_name)
	a.x = value
	B_object.set(variable_name, a)
	if is_instance_valid(update):
		if update.has_method("_update"):
			update._update()
	pass # Replace with function body.


func _on_y_on_value_changed(value):
	if B_object == null: return
	var a = B_object.get(variable_name)
	a.y = value
	B_object.set(variable_name, a)
	if is_instance_valid(update):
		if update.has_method("_update"):
			update._update()
	pass


func _on_z_on_value_changed(value):
	if B_object == null: return
	var a = B_object.get(variable_name)
	a.z = value
	B_object.set(variable_name, a)
	if is_instance_valid(update):
		if update.has_method("_update"):
			update._update()
	pass # Replace with function body.


func _on_reset_pressed():
	B_object.set(variable_name, default)
	if is_instance_valid(update):
		if update.has_method("_update"):
			update._update()
	pass
