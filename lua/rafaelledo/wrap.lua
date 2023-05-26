vim.cmd([[
augroup text_wrapping
  autocmd!
  autocmd BufReadPost *.md,*.txt lua WrapLongLines()
augroup END
]])

function WrapLongLines()
  local width = 90
  if vim.bo.filetype == "markdown" or vim.bo.filetype == "plaintext" then
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.breakindent = true
    vim.wo.breakindentopt = "sbr"
    vim.wo.textwidth = width
  end
end
