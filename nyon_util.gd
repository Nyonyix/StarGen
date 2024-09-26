class_name NyonMath

static func convert_to_e(value: float) -> float:

	if value == 0:
		return 0

	var value_string = str(value)
	
	match value_string[0]:

		"-":
		
			if value_string[1] != "0":

				return 0

			else:

				return 0
		
		"0":

			return 0

		_:

			return 0