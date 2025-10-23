require('trouble').setup({
  modes = {
    diagnostics_split_in_buffer = {
      mode = "diagnostics",
      preview = { type = "split", relative = "win", position = "right", size = 0.3 },
      filter = { buf = 0 },
    },
  },
})
