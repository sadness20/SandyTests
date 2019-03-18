var limit = argument[0];


caret = string_length(text);
if (keyboard_check_pressed(vk_delete)) {
	text = string_delete(text, caret + 1, 1)
}
// actual input:
if (keyboard_string != filltext && keyboard_string != "") {
	var n, l, t;
	t = keyboard_string
	l = string_length(t)
	n = 1
	// find where actual input starts
	while ((n <= l) && (string_char_at(t, n) == fillchar)) n += 1
	c = 11 - n
	if (c > 0 && caret > 0) {
	    caret -= c
	    text = string_delete(text, caret + 1, c)
	}
	c = l - n + 1
	if (c > 0 && string_length(text) < limit) {
	    text = string_insert(string_copy(t, n, c), text, caret + 1)
	    caret += c
	}
}
keyboard_string = filltext
caret = max(0, min(caret, string_length(text)))
	
return(string_replace_all(text, "#", "�"));