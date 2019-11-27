require 'collision'
require 'input'
require 'lines'
require 'texts'

local ball = require 'ball'
local pad_0 = require 'pad_0'
local pad_1 = require 'pad_1'

function set_bg_color(r, g, b)
	bg_color = {r, g, b}
end

function love.load()
	bg_color = {0, 0, 0.1}
	ball.init_ball()
	text_title = love.graphics.setNewFont('fonts/retroFont.ttf', 44)
	text_help = love.graphics.setNewFont('fonts/retroFont.ttf', 24)
	text_score = love.graphics.setNewFont('fonts/retroFont.ttf', 50)
end

function love.update(dt)
	if dt > 0.035 then return end -- pause when hold window
	random_number()
	if not paused then
		pad_0.movements(dt)
		pad_1.movements(dt)

		ball.movements(dt)
		ball.reset_ball()
		ball.ball_screen_col()

		col_pad0_ball()
		col_pad1_ball()
	end
end

function love.draw()
	love.graphics.setBackgroundColor(bg_color)
	if paused then
		paused_text()
		help()
	end

	pad_0.draw_paddle_0()
	pad_1.draw_paddle_1()

	ball.draw_ball()

	draw_lines()

	current_fps()
	score()
end
