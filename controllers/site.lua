local site = {}

local mail = require "src.mail"

function site.index(page)
	local stringVariable = 'this variable is being passed from a "controller" to a "view"!'
    local anotherVar = 2342


    
    --Testing models
    --[[local User = sailor.model("user")
    local u = User:new()

    u.name = "fulana"
    u.password = "blah"

    if(u:save()) then
    	page:write("saved!<br/>")
    end

    local users = User:find_all()
	for _, user in pairs(users) do 
        page:write(user.id.." - "..user.name.."<br/>")
    end]]


    page:write("Finding user with id 1:<br/>")
    local some_user = User:find(1)
    page:write(some_user.id.." - "..some_user.name.."<br/>")

    page:write("Finding user with id 47:<br/>")
    local some_user = User:find(47)
    page:write(some_user.id.." - "..some_user.name.."<br/>")


	if page.POST['email'] ~= nil then
		mail.send_message("<test@example.com>","Yay! Somebody sent an email using your form!","This is the email: "..page.POST['email'])
	end 

    page:render('index',{stringVariable = stringVariable,anotherVar = anotherVar})

end

function site.people(page)
	page:write("hahaha")
end

function site.notindex(page)
	page:render('test/test')
end

return site