-- completion via the built-in LSP completion (0.11+): no autotrigger,
-- manually invoked with <C-k> as before
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('native_completion', { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
  end,
})

vim.keymap.set('i', '<C-k>', function()
  vim.lsp.completion.get()
end, { desc = 'Trigger completion' })

-- confirm with <CR>, taking the first entry if none is selected; falls back
-- to autopairs' <CR> behaviour when no completion menu is open
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    local selected = vim.fn.complete_info({ 'selected' }).selected
    return vim.keycode(selected == -1 and '<C-n><C-y>' or '<C-y>')
  end

  -- autopairs returns already-escaped keycodes, hence replace_keycodes = false
  local ok, autopairs = pcall(require, 'nvim-autopairs')
  if ok then
    return autopairs.autopairs_cr()
  end
  return vim.keycode('<CR>')
end, { expr = true, replace_keycodes = false, desc = 'Confirm completion' })
