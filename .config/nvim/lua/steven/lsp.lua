local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = { 'pylsp', 'ts_ls', 'svelte' }
})

vim.lsp.config( 'pylsp', {
  capabilities = capabilities,
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        ruff = { enabled = true },
        pylsp_mypy = { enabled = false },
        flake8 = { enabled = false },
        rope_autoimport = { enabled = false },
      }
    }
  },
})

vim.lsp.enable( 'ts_ls' )

vim.api.nvim_create_user_command('LspInstallDependencies', function(pkg)
  local venv = vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server/venv"
  local Job = require("plenary.job")
  Job:new({
    command = venv .. "/bin/pip",
    args = { "install", "-U", "--disable-pip-version-check", "pylsp-mypy", "python-lsp-ruff", "rope", "flake8" },
    cwd = venv,
    env = { VIRTUAL_ENV = venv },
    on_exit = function() vim.notify("Finished installing pylsp modules.") end,
    on_start = function() vim.notify("Installing pylsp modules...") end,
  }):start()
end, {})

pcall(function()
  require("mason-registry"):on("package:install:success", vim.cmd.LspInstallDependencies)
end)

pcall(function()
  require("plenary.job"):new({
    command = "pip",
    args = { "install", "pylsp-rope", "python-lsp-ruff", "pylsp-mypy", "pyls-isort" },
    cwd = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/python-lsp-server"),
  }):start()
end)
