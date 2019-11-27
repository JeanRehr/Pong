local pad_1 = {}
pad_1.width = 15
pad_1.height = 100
pad_1.x = w_width - pad_1.width - 5
pad_1.y = w_height / 2 - pad_1.height / 2
pad_1.speed = 1000
pad_1.score = 0
pad_1.def_color = {0.8, 0.8, 0.8}

function pad_1:set_pad_1_color(r, g, b)
	pad_1.def_color = {r, g, b}
end

function pad_1:draw_paddle_1()
	love.graphics.setColor(pad_1.def_color)
	love.graphics.rectangle("fill", pad_1.x, pad_1.y, pad_1.width, pad_1.height)
end

function pad_1:movements()
	if pad_1.y + pad_1.height >= w_height then
		pad_1.y = w_height - pad_1.height
	elseif pad_1.y <= 0 then
		pad_1.y = 0
	end

	if love.keyboard.isDown("o") then
		pad_1.y = pad_1.y - pad_1.speed * love.timer.getDelta()
	elseif love.keyboard.isDown("l") then
		pad_1.y = pad_1.y + pad_1.speed * love.timer.getDelta()
	end
end

return pad_1
