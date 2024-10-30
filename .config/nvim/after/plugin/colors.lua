function SetColor(color)
	color = color or "neopywal"
	vim.cmd.colorscheme(color)
end

SetColor()
