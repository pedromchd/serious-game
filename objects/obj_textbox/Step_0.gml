if (mouse_check_button_released(mb_left)) {
	arr_len = array_length(texto) - 1;
	if (letra < txt_len) {
		letra = txt_len;
	} else
	if (index < arr_len) {
		index++;
		letra = 1;
	} else {
		CoroutineBroadcast("resume");
		instance_destroy(self);
	}
}