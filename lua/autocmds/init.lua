vim.api.nvim_create_autocmd("BufRead", {
	pattern = {"*.S", "*.s", "*.asm"},
	callback = function()
		local first_line = vim.fn.getline(1)
		if ( first_line == "; AVR ASSEMBLY" ) then
            print("AVR Assembly Recognized")
            vim.opt.syntax = "avra"
        elseif ( first_line == "// ARM ASSEMBLY") then
            print("ARM Assembly Recognized")
            vim.opt.syntax = "armv5"
		end
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	pattern = {"*.vert", "*.frag"},
	callback = function()
        vim.opt.filetype = "glsl"
	end,
})

--vim.api.nvim_create_autocmd("BufEnter", {
--	callback = function()
--        local f = vim.fn.expand('%:p')
--        if vim.fn.isdirectory(f) == 0 and not f:match("neo%-tree") then
--            --print(f)
--        	--vim.cmd('Neotree reveal_file=' .. f)
--        end
--	end,
--})
