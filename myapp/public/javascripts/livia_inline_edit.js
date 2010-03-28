function Livia_inlineEdit() {
	jQuery(".livia_input_edit").click(Livia_input);
	jQuery(".livia_textarea_edit").click(Livia_textarea);
}

function Livia_input() {
	self.html("<input type=\"text\" />");
}

function Livia_textarea() {
	self.html("<textarea></textarea>");
}

