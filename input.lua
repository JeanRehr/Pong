local ball = require 'ball'
local pad_0 = require 'pad_0'
local pad_1 = require 'pad_1'

require 'lines'

function love.keypressed(key)
	if key == 'return' or key == 'space' then
		paused = not paused
	end
	-- colors
	if key == '1' then
		set_bg_color(0, 0, 0.1) -- 0, 0, 0.1
		pad_0:set_pad_0_color(0.8, 0.8, 0.8) -- 0.8, 0.8, 0.8
		pad_1:set_pad_1_color(0.8, 0.8, 0.8) -- 0.8, 0.8, 0.8
		ball:set_ball_color(1, 1, 1) -- 1, 1, 1
		set_lines_color(0.8, 0.8, 0.8) -- 0.8, 0.8, 0.8
	elseif key == '2' then
		set_bg_color(0, 0, 0.1)
		pad_0:set_pad_0_color(0.3, 0.3, 0.3)
		pad_1:set_pad_1_color(0.6, 0 ,0)
		ball:set_ball_color(1, 1, 1)
		set_lines_color(0.8, 0.8, 0.8)
	elseif key == '3' then
		set_bg_color(0, 0, 0.1)
		pad_0:set_pad_0_color(0.3, 0.3, 0.3)
		pad_1:set_pad_1_color(0.6, 0 ,0)
		ball:set_ball_color(1, 0.5, 0)
		set_lines_color(0.8, 0.8, 0.8)
	elseif key == '4' then
		set_bg_color(0, 0, 0)
		pad_0:set_pad_0_color(0.8, 0.8, 0.8)
		pad_1:set_pad_1_color(0.8, 0.8 ,0.8)
		ball:set_ball_color(1, 1, 1)
		set_lines_color(0.8, 0.8, 0.8)
	elseif key == '5' then
		set_bg_color(0, 0, 0)
		pad_0:set_pad_0_color(0.3, 0.3 ,0.3)
		pad_1:set_pad_1_color(0.6, 0, 0)
		ball:set_ball_color(1, 1, 1)
		set_lines_color(0.8, 0.8, 0.8)
	elseif key == '6' then
		set_bg_color(0, 0, 0)
		pad_0:set_pad_0_color(0.3, 0.3 ,0.3)
		pad_1:set_pad_1_color(0.6, 0, 0)
		ball:set_ball_color(1, 0.5, 0)
		set_lines_color(0.8, 0.8, 0.8)
	end
end

function love.keyreleased(key)
	if key == 'escape' then
		love.event.quit()
	end

	if key == 'r' then
		love.event.quit('restart')
	end
end
