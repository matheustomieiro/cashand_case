extends GDScriptDialog

func some_dialog(node_name, dialog_name):
	var cd = check_dialog(node_name, dialog_name, "some_dialog")

	if not cd:
		return

	if next_state():
		say({"what": "VN DO SECULO"})
