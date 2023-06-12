extends Area2D

func killing_bad_CPU(body:Node):
	if body is CPU:
		body.kill()
