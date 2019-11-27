local line_top = {}
local line_bot = {}
local line_mid = {}

line_mid.w = 10
line_mid.h = w_height - 50
line_mid.x = w_width / 2 - line_mid.w / 2
line_mid.y = w_height / 2 - line_mid.h / 2
 
line_top.w = w_width
line_top.h = 10
line_top.x = 0
line_top.y = 20

line_bot.w = w_width
line_bot.h = 10
line_bot.x = 0
line_bot.y = w_height - line_bot.h * 3
local lines_def_color = {0.8, 0.8, 0.8}

function set_lines_color(r, g, b)
	lines_def_color = {r, g, b}
end

function draw_lines()
	love.graphics.setColor(lines_def_color)
	love.graphics.rectangle("line", line_mid.x, line_mid.y, line_mid.w, line_mid.h)
	love.graphics.rectangle("fill", line_top.x, line_top.y, line_top.w, line_top.h)
	love.graphics.rectangle("fill", line_bot.x, line_bot.y, line_bot.w, line_bot.h)
end

function get_line_top()
	return line_top.y
end

function get_line_bot()
	return line_bot.y - line_bot.h
end
