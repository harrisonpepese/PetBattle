extends Node
var token = ""
var refreshToken = ""

func logout():
	token=null
	refreshToken=null
func login(ntoken, nrefreshtoken):
	print(ntoken)
	print(nrefreshtoken)
	token = ntoken
	refreshToken= nrefreshtoken
