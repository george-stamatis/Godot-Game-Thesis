extends "res://HurtHitbox/Hitbox.gd"

var speed = Vector2(1000,0)

var flag = Vector2(1,0)
var flagdir = 0
func _physics_process(delta):
	#Οριζουμε κατευθυνση και ταχυτητα του axe
	self.rotation_degrees += 20
	var direction = Vector2.RIGHT.rotated(rotation)
	if flagdir < 0:
		flag = Vector2(1,0)
		global_position -= speed*flag*delta
	else:
		flag = Vector2(-1,0)
		global_position -= speed*flag*delta


func direction(dir):
	if dir < 0 :
		flagdir = -1
	
func destroy():
	queue_free()

func _on_Projectile_area_entered(area):
	#οταν χτυπαει αντικειμενο καταστρεφεται
	destroy()


func _on_Projectile_body_entered(body):
	#οταν χτυπαει σωμα καταστρεφεται
	destroy()


func _on_VisibilityNotifier2D_screen_exited():
	#οταν βγαινει απο την οθονη καταστρεφεται
	queue_free()
