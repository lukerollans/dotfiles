-- build steps for plugins that need them, driven by vim.pack's PackChanged
-- event (fires on install/update/delete)
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('plugin_build_hooks', { clear = true }),
  callback = function(ev)
    if ev.data.kind == 'delete' then
      return
    end

    local name = ev.data.spec.name
    if name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    elseif name == 'nvim-treesitter' and ev.data.kind == 'update' then
      vim.schedule(function()
        require('nvim-treesitter').update()
      end)
    end
  end,
})
