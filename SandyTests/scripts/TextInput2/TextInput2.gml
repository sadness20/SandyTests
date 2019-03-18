var limit = argument[0];

caret_move = max(0, caret_move - 1)
if (keyboard_check(vk_left) != keyboard_check(vk_right)) {
	if (caret_move == 0) {
	    if (keyboard_check(vk_left)) {
	        if (caret2 > 0) caret2 -= 1
	    } else {
	        if (caret2 < string_length(text2)) caret2 += 1
	    }
	    caret_move = caret_move_rate
	}
} else caret_move = 0
if (keyboard_check_pressed(vk_home)) caret2 = 0
if (keyboard_check_pressed(vk_end)) caret2 = string_length(text2)
if (keyboard_check_pressed(vk_delete)) {
	text2 = string_delete(text2, caret2 + 1, 1)
}
// actual input:
if (keyboard_string != filltext2 && keyboard_string != "") {
	var n, l, t;
	t = keyboard_string
	l = string_length(t)
	n = 1
	// find where actual input starts
	while ((n <= l) && (string_char_at(t, n) == fillchar)) n += 1
	c = 11 - n
	if (c > 0 && caret2 > 0) {
	    caret2 -= c
	    text2 = string_delete(text2, caret2 + 1, c)
	}
	c = l - n + 1
	if (c > 0 && string_length(text2) < limit) {
	    text2 = string_insert(string_copy(t, n, c), text2, caret2 + 1)
	    caret2 += c
	}
}
keyboard_string = filltext2
caret2 = max(0, min(caret2, string_length(text2)))
	
return(string_replace_all(text2, "#", "�"));