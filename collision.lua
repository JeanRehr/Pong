require 'lines'

local ball = require 'ball'
local pad_0 = require 'pad_0'
local pad_1 = require 'pad_1'

col_screen_sound = love.audio.newSource('sfx/col_screen_sound.mp3', 'static')
hit_pad0 = love.audio.newSource('sfx/hit_pad0.mp3', 'static')
hit_pad1 = love.audio.newSource('sfx/hit_pad1.mp3', 'static')

function random_number()
	rand_num = math.random(10) -- for random purposes
	local tick = 0
	local tick = tick + love.timer.getDelta()
	if tick > rand_num then
		rand_num = math.random(10)
		local tick = 0
	end
end

function ball:ball_screen_col()
	if ball.y < 0 or ball.y < get_line_top() + ball.height then
		ball.speed_y = math.abs(ball.speed_y)
		love.audio.play(col_screen_sound)
	elseif ball.y > w_height - ball.height or ball.y > get_line_bot() then
		ball.speed_y = -math.abs(ball.speed_y)
		love.audio.play(col_screen_sound)
	end
end

function col_pad0_ball()
	if ball.x - ball.width / 2 <=  pad_0.x + pad_0.width and -- front
	   ball.y + ball.height > pad_0.y and -- not higher
	   ball.y < pad_0.y + pad_0.height and -- not lower
	   ball.x > pad_0.x - pad_0.width -- passed through
	then
		love.audio.play(hit_pad0)
		if love.keyboard.isDown('w') then
			if rand_num == 1 then
				ball.speed_x = math.abs(ball.speed_x - math.random(-25, 250))
				ball.speed_y = math.abs(ball.speed_y + math.random(500, 700))
			end
			ball.speed_x = math.abs(ball.speed_x - math.random(-50, 250))
			ball.speed_y = math.abs(ball.speed_y + math.random(90, 110))
		elseif love.keyboard.isDown('w') and ball.x - ball.width / 2 <= pad_0.height / 8 then
			ball.speed_x = math.abs(ball.speed_x - math.random(-50, 250))
			ball.speed_y = math.abs(ball.speed_y + math.random(100, 120))
		elseif love.keyboard.isDown('s') then
			if rand_num == 1 then
				ball.speed_x = math.abs(ball.speed_x - math.random(-25, 250))
				ball.speed_y = -math.abs(ball.speed_y + math.random(500, 700))
			end
			ball.speed_x = math.abs(ball.speed_x - math.random(-50, 250))
			ball.speed_y = -math.abs(ball.speed_y + math.random(90, 120))
		elseif love.keyboard.isDown('s') and ball.x - ball.width / 2 >= pad_0.height - 18.75 then
			ball.speed_x = math.abs(ball.speed_x - math.random(-50, 250))
			ball.speed_y = -math.abs(ball.speed_y + math.random(100, 130))
		elseif ball.speed_y > 600 then
			ball.speed_x = -math.abs(ball.speed_x - math.random(-150, 50))
			ball.speed_y = math.random(-20, 20)
		else
			ball.speed_y = 0
			ball.speed_x = math.abs(ball.speed_x - math.random(-150, 50))
			ball.speed_y = -math.abs(ball.speed_y + math.random(-15, 15))
		end
	end
end

function col_pad1_ball()
	if ball.x >= w_width - pad_1.width * 2 and -- front
	   ball.y + ball.height > pad_1.y and -- not higher
	   ball.y < pad_1.y + pad_1.height and -- not lower
	   ball.x > pad_1.x - pad_1.width -- passed through
	then
		love.audio.play(hit_pad1)
		if love.keyboard.isDown('o') then
			if rand_num == 1 then
				ball.speed_x = -math.abs(ball.speed_x + math.random(-50, 250))
				ball.speed_y = math.abs(ball.speed_y + math.random(500, 700))
			end
			ball.speed_x = -math.abs(ball.speed_x + math.random(-50, 250))
			ball.speed_y = math.abs(ball.speed_y + math.random(90, 110))
		elseif love.keyboard.isDown('o') and ball.x - ball.width / 2 <= pad_1.x + pad_1.height / 8 then
			ball.speed_x = -math.abs(ball.speed_x + math.random(-50, 250))
			ball.speed_y = math.abs(ball.speed_y + math.random(100, 120))
		elseif love.keyboard.isDown('l') then
			if rand_num == 1 then
				ball.speed_x = -math.abs(ball.speed_x + math.random(-50, 250))
				ball.speed_y = -math.abs(ball.speed_y + math.random(500, 700))
			end
			ball.speed_x = -math.abs(ball.speed_x + math.random(-50, 250))
			ball.speed_y = -math.abs(ball.speed_y + math.random(90, 110))
		elseif love.keyboard.isDown('l') and ball.x - ball.width / 2 <= pad_1.x + pad_1.height - 18.75 then
			ball.speed_x = math.abs(ball.speed_x + math.random(-50, 250))
	 		ball.speed_y = -math.abs(ball.speed_y + math.random(100, 120))
		elseif ball.speed_y > 600 then
			ball.speed_x = -math.abs(ball.speed_x + math.random(-150, 50))
			ball.speed_y = math.random(-20, 20)
		else
			ball.speed_y = 0
			ball.speed_x = -math.abs(ball.speed_x + math.random(-150, 50))
			ball.speed_y = -math.abs(ball.speed_y + math.random(-10, 10))
		end
	end
end
