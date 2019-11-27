local pad_0 = {}
pad_0.width = 15
pad_0.height = 100
pad_0.x = 5
pad_0.y = w_height / 2 - pad_0.height / 2
pad_0.speed = 1000
pad_0.score = 0
pad_0.def_color = {0.8, 0.8, 0.8}

function pad_0:set_pad_0_color(r, g, b)
	pad_0.def_color = {r, g, b}
end

function pad_0:draw_paddle_0()
	love.graphics.setColor(pad_0.def_color)
	love.graphics.rectangle("fill", pad_0.x, pad_0.y, pad_0.width, pad_0.height)
end

function pad_0:movements(dt)
	if pad_0.y + pad_0.height >= w_height then
		pad_0.y = w_height - pad_0.height
	elseif pad_0.y <= 0 then
		pad_0.y = 0
	end

	if love.keyboard.isDown("w") then
		pad_0.y = pad_0.y - pad_0.speed * love.timer.getDelta()
	elseif love.keyboard.isDown("s") then
		pad_0.y = pad_0.y + pad_0.speed * love.timer.getDelta()
	end
end

return pad_0
