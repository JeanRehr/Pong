local lines = require 'lines'
local pad_0 = require 'pad_0'
local pad_1 = require 'pad_1'
local ball = require 'ball'

function paused_text()
	love.graphics.setFont(text_title)
	love.graphics.printf("Pong!", -100, 75, w_width, 'center')
	love.graphics.setFont(text_help)
	love.graphics.printf("Press h for help.", 5, 0, w_width )
end

function current_fps()
	love.graphics.setFont(text_help)
	love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 5, w_height - 20)
end

function help()
	if love.keyboard.isDown("h") then
		love.graphics.setFont(text_help)
		love.graphics.printf("\t\tButtons:\nh - Displays this text.\nw - Left pad up.\ns - Left pad down.\no - Right pad up.\nl - Right pad down.\n1 to 6 - Colors.\nspace/enter - Pause.\nesc - Exit.", 850, 75, w_width)
	end
end

function score()
	love.graphics.setFont(text_score)
	love.graphics.print(pad_0.score, w_width / 2 - 65, get_line_top() + 5)
	love.graphics.print(pad_1.score, w_width / 2 + 40, get_line_top() + 5)
end
