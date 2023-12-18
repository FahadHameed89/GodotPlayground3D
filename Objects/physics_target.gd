extends RigidBody3D

var Health = 10

func Hit_Successful(Damage, _Direction:= Vector3.ZERO, _Position:= Vector3.ZERO):
	Health -= Damage
	print("Target HP: " + str(Health))
	
	if Health <= 0:
		queue_free()
