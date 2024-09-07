-- Set <space> as the leader key
vim.g.mapleader = " "

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = "a"
vim.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars = { vert = '│', fold = '─' }
vim.opt.showbreak = '↪ '


-- Custom startup screen
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
      vim.cmd [[
        enew
        setlocal
          \ bufhidden=wipe
          \ buftype=nofile
          \ nobuflisted
          \ nocursorcolumn
          \ nocursorline
          \ nolist
          \ nonumber
          \ noswapfile
          \ norelativenumber
        let s:header = [
          \ '   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
          \ '   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
          \ '   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
          \ '   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
          \ '   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
          \ '   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
          \ '',
          \ '   Shni 3andk akhawa!',
          \ ]
        let s:center = (winheight(0) - len(s:header)) / 2
        for line in s:header
          call append(s:center, line)
          let s:center += 1
        endfor
      ]]
    end
  end,
})

-- Install and configure plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add your configuration here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
},
{
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  },
},
{
  "folke/twilight.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  },
},
{
  "nvim-tree/nvim-web-devicons",
},
{
  "stevearc/dressing.nvim",
  opts = {},
},
  -- Color scheme (changed to a dark theme with yellow accents)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        highlight_overrides = {
          mocha = function(C)
            return {
              Normal = { bg = C.base },
              CursorLine = { bg = "#1a1a1a" },
              LineNr = { fg = "#4a4a4a" },
              CursorLineNr = { fg = "#808080", style = { "bold" } },
              Visual = { bg = "#264f78" },
              Search = { bg = "#365880" },
              IncSearch = { bg = "#365880" },
              Pmenu = { fg = "#d0d0d0", bg = "#1a1a1a" },
              PmenuSel = { fg = "#ffffff", bg = "#264f78" },
              SignColumn = { bg = C.base },
            }
          end,
        },
      })
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "onsails/lspkind.nvim",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },

  -- Indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
  },

  -- Comment toggler
  {
    "numToStr/Comment.nvim",
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
  },

  -- Git commit message
  {
    "rhysd/committia.vim",
  },

  -- Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

  -- Enhanced C/C++ support
  { "p00f/clangd_extensions.nvim" },

  -- Git commit message generator
  { "olacin/telescope-cc.nvim" },

  -- Flutter support
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = true,
  },

  -- Dart syntax highlighting
  { "dart-lang/dart-vim-plugin" },

  -- AI completion for Dart and Flutter
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["dart"] = true,
		["*"] = true,
		["rust"] = true,
		["*"] = true,
		["clangd"] = true,
      }
    end,
  },
})

-- Noice setup
require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

-- Zen mode setup
require("zen-mode").setup({
  window = {
    backdrop = 0.95,
    width = 120,
    height = 1,
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
  },
})

-- Twilight setup
require("twilight").setup({
  dimming = {
    alpha = 0.25,
    color = { "Normal", "#ffffff" },
    inactive = false,
  },
  context = 10,
  treesitter = true,
  expand = {
    "function",
    "method",
    "table",
    "if_statement",
  },
})

-- Dressing.nvim setup
require("dressing").setup({
  input = {
    enabled = true,
    default_prompt = "Input:",
    prompt_align = "left",
    insert_only = true,
    start_in_insert = true,
    anchor = "SW",
    border = "rounded",
    relative = "cursor",
    prefer_width = 40,
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
    win_options = {
      winblend = 10,
      winhighlight = "",
    },
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
    override = function(conf)
      return conf
    end,
    get_config = nil,
  },
  select = {
    enabled = true,
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
    trim_prompt = true,
    telescope = nil,
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },
    fzf_lua = {
      winopts = {
        width = 0.5,
        height = 0.4,
      },
    },
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 10,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },
    builtin = {
      anchor = "NW",
      border = "rounded",
      relative = "editor",
      win_options = {
        winblend = 10,
        winhighlight = "",
      },
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      override = function(conf)
        return conf
      end,
    },
    format_item_override = {},
    get_config = nil,
  },
})

-- Color scheme
vim.cmd.colorscheme "catppuccin-mocha"

-- Customize colors for a darker theme with yellow accents
vim.cmd([[
  try
    colorscheme catppuccin
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
    set background=dark
  endtry
]])

-- Keybindings
local keymap = vim.keymap.set
keymap("n", "<leader>e", ":Neotree toggle<CR>")
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap("n", "<leader>fb", ":Telescope file_browser<CR>")
keymap("n", "<leader>fh", ":Telescope help_tags<CR>")
keymap("n", "<leader>fp", ":Telescope project<CR>")
keymap("n", "<leader>gc", ":LazyGit<CR>")
keymap("n", "<leader>gg", ":Gitsigns toggle_signs<CR>")
-- Zen mode toggle
keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })

-- Twilight toggle
keymap("n", "<leader>tw", ":Twilight<CR>", { noremap = true, silent = true })


-- LSP configuration
require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configure LSP servers here
local servers = { "lua_ls", "pyright", "tsserver", "rust_analyzer", "clangd", "dartls" }
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
})
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

-- Clangd extensions setup
require("clangd_extensions").setup {
  server = {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
  },
  extensions = {
    autoSetHints = true,
    inlay_hints = {
      inline = vim.fn.has("nvim-0.10") == 1,
      only_current_line = false,
      only_current_line_autocmd = "CursorHold",
      show_parameter_hints = true,
      show_variable_name = false,
      parameter_hints_prefix = "<- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
      priority = 100,
    },
    ast = {
      role_icons = {
        type = "🄣",
        declaration = "🄓",
        expression = "🄔",
        statement = ";",
        specifier = "🄢",
        ["template argument"] = "🆃",
      },
      kind_icons = {
        Compound = "🄲",
        Recovery = "🅁",
        TranslationUnit = "🅄",
        PackExpansion = "🄿",
        TemplateTypeParm = "🅃",
        TemplateTemplateParm = "🅃",
        TemplateParamObject = "🅃",
      },
      highlights = {
        detail = "Comment",
      },
    },
    memory_usage = {
      border = "none",
    },
    symbol_info = {
      border = "none",
    },
  },
}

-- Autocompletion setup
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "javascript", "python", "rust", "dart" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

-- Telescope configuration
require("telescope").setup({
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
    },
    project = {
      base_dirs = {
        -- Change this to a directory that exists on your system
        vim.fn.expand("~/.config"),
      },
    },
  },
})
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")

-- Conventional Commits setup
require("telescope").load_extension("conventional_commits")
keymap("n", "<leader>cc", ":Telescope conventional_commits<CR>", { noremap = true, silent = true })

-- Auto pairs configuration
require("nvim-autopairs").setup({
  check_ts = true,
  ts_config = {
    lua = {"string"},
    javascript = {"template_string"},
    java = false,
  },
})

-- Setup neovim lua configuration
require("neodev").setup()

-- Neo-tree
require("neo-tree").setup({
  close_if_last_window = true,
  enable_git_status = true,
  enable_diagnostics = true,
})

-- Comment
require("Comment").setup()

-- Indent blankline
require("ibl").setup()

-- Gitsigns
require("gitsigns").setup()

-- Which-key
require("which-key").setup()

-- Neoscroll
require("neoscroll").setup()

-- Lualine
require("lualine").setup({
  options = {
    theme = "catppuccin",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
    icons_enabled = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_modified_status = true,
        mode = 2,
        max_length = vim.o.columns * 2 / 3,
        buffers_color = {
          active = {fg = '#ffffff', bg = '#000000'},
          inactive = {fg = '#888888', bg = '#000000'},
        },
      }
    },
    lualine_b = {'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        mode = 2,
        tabs_color = {
          active = {fg = '#ffffff', bg = '#000000'},
          inactive = {fg = '#888888', bg = '#000000'},
        },
      },
    }
  },
  extensions = {'neo-tree', 'fugitive', 'quickfix'}

})

-- DAP (Debugger)
local dap = require("dap")
local dapui = require("dapui")

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode",
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

dapui.setup()

-- Keybindings for debugger
keymap("n", "<leader>db", dap.toggle_breakpoint)
keymap("n", "<leader>dc", dap.continue)
keymap("n", "<leader>di", dap.step_into)
keymap("n", "<leader>do", dap.step_over)
keymap("n", "<leader>dO", dap.step_out)
keymap("n", "<leader>dr", dap.repl.open)
keymap("n", "<leader>dl", dap.run_last)
keymap("n", "<leader>du", dapui.toggle)

-- Committia configuration
vim.g.committia_hooks = {
  edit_open = function(info)
    -- Additional keymapping
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>cc", ":CommittiaCancelCommit<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(0, "n", "<leader>ca", ":CommittiaAmend<CR>", { silent = true })
  end
}

-- Function to create a new file
local function create_file()
  local name = vim.fn.input("Enter file name: ")
  if name ~= "" then
    local path = vim.fn.expand("%:p:h") .. "/" .. name
    vim.cmd("edit " .. path)
  end
end

keymap("n", "<leader>nf", create_file, { noremap = true, silent = true })

-- Additional file operations
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>")  -- Recent files
keymap("n", "<leader>fs", ":w<CR>")  -- Save file
keymap("n", "<leader>fS", ":wa<CR>")  -- Save all files
keymap("n", "<leader>fd", ":Telescope find_files cwd=~/.config/nvim<CR>")  -- Find in dotfiles

-- Git operations
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")  -- Toggle git blame
keymap("n", "<leader>gd", ":Gitsigns diffthis<CR>")  -- View git diff
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")  -- Preview git hunk

-- LSP keybindings
keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "gi", vim.lsp.buf.implementation)
keymap("n", "<C-k>", vim.lsp.buf.signature_help)
keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
keymap("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
keymap("n", "<space>D", vim.lsp.buf.type_definition)
keymap("n", "<space>rn", vim.lsp.buf.rename)
keymap("n", "<space>ca", vim.lsp.buf.code_action)
keymap("n", "gr", vim.lsp.buf.references)
keymap("n", "<space>f", function() vim.lsp.buf.format { async = true } end)

-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.cindent = true
    vim.opt_local.cino = "g0"
  end
})

-- Function to generate a conventional commit message
local function generate_commit_message()
  local type = vim.fn.input("Commit type (feat/fix/docs/style/refactor/test/chore): ")
  local scope = vim.fn.input("Scope (optional): ")
  local subject = vim.fn.input("Subject: ")

  local message = type
  if scope ~= "" then
    message = message .. "(" .. scope .. ")"
  end
  message = message .. ": " .. subject

  local body = vim.fn.input("Body (optional, press Enter to skip): ")
  if body ~= "" then
    message = message .. "\n\n" .. body
  end

  local breaking_change = vim.fn.input("Breaking change (optional, press Enter to skip): ")
  if breaking_change ~= "" then
    message = message .. "\n\nBREAKING CHANGE: " .. breaking_change
  end

  -- Open a new buffer with the generated commit message
  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(message, "\n"))
  vim.bo.filetype = "gitcommit"
  vim.cmd("setlocal spell")

  print("Commit message generated. You can edit it before saving.")
end

-- Keybinding for generating commit message
keymap("n", "<leader>gc", generate_commit_message, { noremap = true, silent = true })

-- Enhanced C/C++ specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- Set indentation to 2 spaces for C/C++
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true

    -- Enable clang-format on save
    vim.b.formatprg = "clang-format"
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

    -- Add include path for better autocompletion
    vim.opt_local.path:append("/usr/include,/usr/local/include")
  end
})

-- Function to compile and run C/C++ files
local function compile_and_run()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%:p")
  local output = vim.fn.expand("%:p:r")

  if filetype == "c" then
    vim.cmd("!gcc -o " .. output .. " " .. filename .. " && " .. output)
  elseif filetype == "cpp" then
    vim.cmd("!g++ -o " .. output .. " " .. filename .. " && " .. output)
  else
    print("Not a C or C++ file")
  end
end

keymap("n", "<leader>cr", compile_and_run, { noremap = true, silent = true })

-- Set up telescope-conventional-commits
require("telescope").load_extension("conventional_commits")
keymap("n", "<leader>cc", ":Telescope conventional_commits<CR>", { noremap = true, silent = true })

-- Additional useful mappings
keymap("n", "<leader>h", ":nohlsearch<CR>")  -- Clear search highlighting
keymap("n", "<leader>w", ":set wrap!<CR>")   -- Toggle word wrap
keymap("n", "<leader>ln", ":set number!<CR>") -- Toggle line numbers
keymap("n", "<leader>sp", ":set spell!<CR>")  -- Toggle spell check

-- Split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Terminal mappings
keymap("t", "<Esc>", "<C-\\><C-n>")  -- Exit terminal mode with Esc
keymap("n", "<leader>t", ":split | terminal<CR>")  -- Open terminal in split

-- Quickfix list navigation
keymap("n", "]q", ":cnext<CR>")
keymap("n", "[q", ":cprev<CR>")
keymap("n", "<leader>qo", ":copen<CR>")
keymap("n", "<leader>qc", ":cclose<CR>")

-- Buffer navigation
keymap("n", "<leader>bn", ":bnext<CR>")
keymap("n", "<leader>bp", ":bprevious<CR>")
keymap("n", "<leader>bd", ":bdelete<CR>")

-- Toggle relative line numbers
keymap("n", "<leader>rn", ":set relativenumber!<CR>")

-- Center search results
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- Keep visual selection when indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move selected lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')

-- Paste from system clipboard
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>p", '"+p')

-- Quick save
keymap("n", "<leader>w", ":w<CR>")

-- Quick quit
keymap("n", "<leader>q", ":q<CR>")

-- Source current file
keymap("n", "<leader>so", ":so %<CR>")

-- Flutter and Dart specific configurations
require("flutter-tools").setup({
  ui = {
    border = "rounded",
    notification_style = "native",
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  dev_log = {
    enabled = true,
    open_cmd = "tabedit",
  },
})

-- Flutter commands
vim.api.nvim_create_user_command("FlutterRun", "FlutterRun", {})
vim.api.nvim_create_user_command("FlutterDevices", "FlutterDevices", {})
vim.api.nvim_create_user_command("FlutterEmulators", "FlutterEmulators", {})
vim.api.nvim_create_user_command("FlutterReload", "FlutterReload", {})
vim.api.nvim_create_user_command("FlutterRestart", "FlutterRestart", {})
vim.api.nvim_create_user_command("FlutterQuit", "FlutterQuit", {})
vim.api.nvim_create_user_command("FlutterDetach", "FlutterDetach", {})
vim.api.nvim_create_user_command("FlutterOutlineToggle", "FlutterOutlineToggle", {})
vim.api.nvim_create_user_command("FlutterOutlineOpen", "FlutterOutlineOpen", {})
vim.api.nvim_create_user_command("FlutterDevTools", "FlutterDevTools", {})
vim.api.nvim_create_user_command("FlutterCopyProfilerUrl", "FlutterCopyProfilerUrl", {})
vim.api.nvim_create_user_command("FlutterLspRestart", "FlutterLspRestart", {})

-- Flutter keybindings
keymap("n", "<leader>fr", ":FlutterRun<CR>")
keymap("n", "<leader>fd", ":FlutterDevices<CR>")
keymap("n", "<leader>fe", ":FlutterEmulators<CR>")
keymap("n", "<leader>fR", ":FlutterReload<CR>")
keymap("n", "<leader>fF", ":FlutterRestart<CR>")
keymap("n", "<leader>fq", ":FlutterQuit<CR>")
keymap("n", "<leader>fD", ":FlutterDetach<CR>")
keymap("n", "<leader>fo", ":FlutterOutlineToggle<CR>")
keymap("n", "<leader>fO", ":FlutterOutlineOpen<CR>")
keymap("n", "<leader>ft", ":FlutterDevTools<CR>")
keymap("n", "<leader>fp", ":FlutterCopyProfilerUrl<CR>")
keymap("n", "<leader>fl", ":FlutterLspRestart<CR>")

-- Function to create a new Flutter project
local function create_flutter_project()
  local project_name = vim.fn.input("Enter Flutter project name: ")
  if project_name ~= "" then
    local cmd = string.format("flutter create %s", project_name)
    vim.fn.system(cmd)
    print("Flutter project created: " .. project_name)
  else
    print("Project creation cancelled")
  end
end

-- Function to run Flutter web app on Chrome
local function run_flutter_web()
  vim.fn.system("flutter run -d chrome")
end

-- Function to build Flutter web app
local function build_flutter_web()
  vim.fn.system("flutter build web")
  print("Flutter web app built")
end

-- Function to run Flutter tests
local function run_flutter_tests()
  vim.fn.system("flutter test")
end

-- Custom commands for Flutter web development
vim.api.nvim_create_user_command("FlutterCreateProject", create_flutter_project, {})
vim.api.nvim_create_user_command("FlutterWebRun", run_flutter_web, {})
vim.api.nvim_create_user_command("FlutterWebBuild", build_flutter_web, {})
vim.api.nvim_create_user_command("FlutterTest", run_flutter_tests, {})

-- Keybindings for Flutter development
keymap("n", "<leader>fc", ":FlutterCreateProject<CR>")
keymap("n", "<leader>fw", ":FlutterWebRun<CR>")
keymap("n", "<leader>fb", ":FlutterWebBuild<CR>")
keymap("n", "<leader>ft", ":FlutterTest<CR>")

-- Additional useful mappings
keymap("n", "<leader>h", ":nohlsearch<CR>")  -- Clear search highlighting
keymap("n", "<leader>w", ":set wrap!<CR>")   -- Toggle word wrap
keymap("n", "<leader>ln", ":set number!<CR>") -- Toggle line numbers
keymap("n", "<leader>sp", ":set spell!<CR>")  -- Toggle spell check

-- Split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Terminal mappings
keymap("t", "<Esc>", "<C-\\><C-n>")  -- Exit terminal mode with Esc
keymap("n", "<leader>t", ":split | terminal<CR>")  -- Open terminal in split

-- Quickfix list navigation
keymap("n", "]q", ":cnext<CR>")
keymap("n", "[q", ":cprev<CR>")
keymap("n", "<leader>qo", ":copen<CR>")
keymap("n", "<leader>qc", ":cclose<CR>")

-- Buffer navigation
keymap("n", "<leader>bn", ":bnext<CR>")
keymap("n", "<leader>bp", ":bprevious<CR>")
keymap("n", "<leader>bd", ":bdelete<CR>")

-- Toggle relative line numbers
keymap("n", "<leader>rn", ":set relativenumber!<CR>")

-- Center search results
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- Keep visual selection when indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Move selected lines up and down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y')
keymap("v", "<leader>y", '"+y')

-- Paste from system clipboard
keymap("n", "<leader>p", '"+p')
keymap("v", "<leader>p", '"+p')

-- Quick save
keymap("n", "<leader>w", ":w<CR>")

-- Quick quit
keymap("n", "<leader>q", ":q<CR>")

-- Source current file
keymap("n", "<leader>so", ":so %<CR>")

-- Debugger keybindings
keymap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
keymap("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
keymap("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
keymap("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
keymap("n", "<leader>dO", ":lua require'dap'.step_out()<CR>")
keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>")
keymap("n", "<leader>du", ":lua require'dapui'.toggle()<CR>")

-- Markdown preview
keymap("n", "<leader>mp", ":MarkdownPreview<CR>")
keymap("n", "<leader>ms", ":MarkdownPreviewStop<CR>")
keymap("n", "<leader>mt", ":MarkdownPreviewToggle<CR>")

-- LSP keybindings
keymap("n", "gD", vim.lsp.buf.declaration)
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "gi", vim.lsp.buf.implementation)
keymap("n", "<C-k>", vim.lsp.buf.signature_help)
keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
keymap("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
keymap("n", "<space>D", vim.lsp.buf.type_definition)
keymap("n", "<space>rn", vim.lsp.buf.rename)
keymap("n", "<space>ca", vim.lsp.buf.code_action)
keymap("n", "gr", vim.lsp.buf.references)
keymap("n", "<space>f", function() vim.lsp.buf.format { async = true } end)

-- Telescope keybindings
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")
keymap("n", "<leader>fh", ":Telescope help_tags<CR>")
keymap("n", "<leader>fc", ":Telescope colorscheme<CR>")
keymap("n", "<leader>f/", ":Telescope current_buffer_fuzzy_find<CR>")

-- Git keybindings
keymap("n", "<leader>gc", ":Telescope git_commits<CR>")
keymap("n", "<leader>gfc", ":Telescope git_bcommits<CR>")
keymap("n", "<leader>gb", ":Telescope git_branches<CR>")
keymap("n", "<leader>gs", ":Telescope git_status<CR>")

-- Copilot keybindings
keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
keymap("i", "<C-H>", 'copilot#Previous()', { silent = true, expr = true })
keymap("i", "<C-K>", 'copilot#Next()', { silent = true, expr = true })


