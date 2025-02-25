vim.api.nvim_create_autocmd("FileType", {
	desc = "emmet as tab when writing html",
	pattern = { "html", "jsx", "tsx", "md" },
	callback = function()
		vim.cmd([[
      imap <buffer> <expr> <Tab> pumvisible() ? "\<C-n>" : emmet#expandAbbrIntelligent("\<Tab>")
    ]])
	end,
})
