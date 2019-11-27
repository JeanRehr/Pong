local pad_0 = require 'pad_0'
local pad_1 = require 'pad_1'

local ball = {}

ball.def_color = {1, 1, 1}
ball.born = love.audio.newSource('sfx/born.mp3', 'static')

function ball:init_ball()
	ball.width = 10
	ball.height = 10
	ball.x = w_width / 2 - ball.width / 2
	ball.y = w_height / 2 - ball.height / 2
	ball.speed_x = -623
	ball.speed_y = 147
	love.audio.play(ball.born)
	paused = true
end

function ball:set_ball_color(r, g, b)
	ball.def_color = {r, g, b}
end

function ball:draw_ball()
	love.graphics.setColor(ball.def_color)
	love.graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
end

function ball:movements(dt)
	ball.x = ball.x + ball.speed_x * love.timer.getDelta()
	ball.y = ball.y + ball.speed_y * love.timer.getDelta()

	-- limiting speed
	if ball.speed_x > -400 and ball.speed_x < 0 then
		ball.speed_x = math.random(-400, -500)
	elseif ball.speed_x < 400 and ball.speed_x > 0 then
		ball.speed_x = math.random(400, 500)
	elseif ball.speed_x < -1400 and ball.speed_x < 0 then
		ball.speed_x = math.random(-1350, -1400)
	elseif ball.speed_x > 1400 and ball.speed_x > 0 then
		ball.speed_x = math.random(1350, 1400)
	end
end

function ball:reset_ball()
	if ball.x > w_width then
		ball:init_ball()
		ball.speed_x = 623
		pad_0.score = pad_0.score + 1
	elseif ball.x < 0 then
		ball:init_ball()
		pad_1.score = pad_1.score + 1
	end
end

return ball
