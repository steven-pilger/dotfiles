local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
	extensions = {
		fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
		live_grep_args = {
			auto_quoting = true,
			mappings = { i = { ["<C-k>"] = lga_actions.quote_prompt(), ["<C-r>"] = actions.to_fuzzy_refine } },
		},
	},
	defaults = {
		mappings = { i = { ["<C-q>"] = actions.send_selected_to_qflist } },
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim", -- add this value
		},
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.8,
			mirror = true,
			prompt_position = "top",
			preview_cutoff = 20,
			preview_height = function(_, _, max_lines)
				return max_lines - 15
			end,
		},
	},
	pickers = {
		find_files = {
			on_input_filter_cb = function(prompt)
				local new = prompt:gsub("%s+", "_")
				if new ~= prompt then
					return { prompt = new, caret = #new }
				end
				return prompt
			end,
		},
	},
})

require("telescope").load_extension("lines")
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")

require("actions-preview").setup({
	telescope = {
		sorting_strategy = "ascending",
		layout_strategy = "vertical",
		layout_config = {
			width = 0.8,
			height = 0.6,
			mirror = true,
			prompt_position = "top",
			preview_cutoff = 20,
			preview_height = function(_, _, max_lines)
				return max_lines - 15
			end,
		},
	},
})
