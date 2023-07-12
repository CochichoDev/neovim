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
