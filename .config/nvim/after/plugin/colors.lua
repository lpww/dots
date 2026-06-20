require("neopywal").setup({
	use_wallust = true,
})

function SetColor(color)
	color = color or "neopywal"
	vim.cmd.colorscheme(color)
end

SetColor()
