extends StaticBody3D

var Health = 1

func Hit_Successful(Damage, _Direction:= Vector3.ZERO, _Position:= Vector3.ZERO):

	var Hit_Position = _Position - get_global_transform().origin

	Health -= Damage
	print("Target HP: " + str(Health))
	if Health <= 0:
		queue_free()

