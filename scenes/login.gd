extends Control
var username = ""
var password = ""
@onready var http_request = $HTTPRequest
@onready var email_input = $Panel/MarginContainer/VBoxContainer/Email
@onready var password_input = $Panel/MarginContainer/VBoxContainer/Password
@onready var textlabel = $Panel/MarginContainer/VBoxContainer/Label2
var url ="http://localhost:3000/auth"
# Called when the node enters the scene tree for the first time.
func _ready():
	email_input.text = "tilapio@gmail.com"
	password_input.text = "12345678"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	var json = JSON.stringify({
		"username": email_input.text,
		"password": password_input.text
	})
	var headers = ["Content-Type: application/json"]
	http_request.request(url,headers,HTTPClient.METHOD_POST,json)

func _on_http_request_request_completed(result, response_code, headers, body):
	if(response_code != 201):
		textlabel.text = "não autorizado"
		return
	var data = JSON.parse_string(body.get_string_from_utf8())
	AuthStore.login(data.accessToken,data.refreshToken)
	textlabel.text = "Login feito com sucesso"
