local system_prompt = ' \
    You are an expert software developer. \
    You only respond with code snippets. \
    The code snippets you write are concise and readable. \
'

local lmstudio_provider = require('model.providers.openai')
local lmstudio_options = {
  url = 'http://127.0.0.1:1234/v1',
  authorization = 'not-needed',
}

local lmstudio_prompt = {
  provider = lmstudio_provider,
  options = lmstudio_options,
  builder = function(input)
    return {
      model = "stable-code-3b",
      temperature = 0.2,
      n_predict = -1,
      top_k = 40,
      repeat_penalty = 1.1,
      min_p = 0.05,
      top_p = 0.9,
      max_tokens = 400,
      messages = {
        { role = "system", content = system_prompt },
        { role = "user", content = input },
      },
    }
  end,
}

local function prompt(callback, initial_content, title)
  local bufnr = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_option(bufnr, 'buftype', 'prompt')

  vim.cmd(':b ' .. bufnr)
  vim.api.nvim_set_option_value('winbar', title or 'Prompt', { scope = 'local' })

  if initial_content ~= nil then
    if type(initial_content) == "string" then
      initial_content = vim.fn.split(initial_content, '\n')
    end
    vim.api.nvim_buf_set_text(bufnr, 0, 0, 0, 0, initial_content)
  end

  vim.fn.prompt_setcallback(bufnr, function(user_input)
    local buf_content = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -3, false), '\n')
    local ok, result = pcall(callback, user_input, buf_content)
    if not ok then
      vim.notify(result, vim.log.levels.ERROR)
    end
    vim.cmd(':bd! ' .. bufnr)
  end)

  vim.cmd.startinsert()
end

local function user_prompt(callback, input, title)
  return function(resolve)
    prompt(function(user_input, buffer_content)
      resolve(callback(user_input, buffer_content))
    end, input, title)
  end
end

local lmstudio_ask = {
  provider = lmstudio_provider,
  options = lmstudio_options,
  mode = 'buffer',
  builder = function(input)
    local messages = { { role = 'user', content = input } }
    return user_prompt(function(next_input)
      if #next_input > 0 then
        table.insert(messages, { role = 'user', content = next_input })
      end
      return { messages = messages }
    end, input)
  end,
}

local lmstudio_commit_message = {
  provider = lmstudio_provider,
  options = lmstudio_options,
  mode = 'insert',
  builder = function()
    local git_diff = vim.fn.system({ 'git', 'diff', '--staged' })
    return {
      messages = {
        {
          role = 'system',
          content = '\
            You are a helpful coding assistant that only returns a single commit message.\
            Write a short commit message according to the Conventional Commits specification\
            Do not explain yourself.\
            Do not include the scope, body or footter.\
            Here is an example structure of your response: "<type>: <description>"\
            Use the following git diff:\
            ```\n' .. git_diff .. '```\
          ',
        },
      },
    }
  end,
}

local function input_if_selection(input, context)
  return context.selection and input or ''
end

local lmstudio_chat = {
  provider = lmstudio_provider,
  options = lmstudio_options,
  create = input_if_selection,
  system = system_prompt,
  run = function(messages, config)
    if config.system then
      table.insert(messages, 1, { role = 'system', content = config.system })
    end
    return { messages = messages }
  end,
}

local ollama_provider = require('model.providers.ollama')

local ollama_chat = {
  provider = ollama_provider,
  create = input_if_selection,
  params = { model = 'codegemma:7b' },
  system = system_prompt,
  run = function(messages, config)
    if config.system then
      table.insert(messages, 1, { role = 'system', content = config.system })
    end
    return { messages = messages }
  end,
}

local ollama_ask = {
  provider = ollama_provider,
  params = { model = 'codegemma:7b' },
  mode = 'buffer',
  system = system_prompt,
  builder = function(input)
    local messages = { { role = 'user', content = input } }
    return user_prompt(function(next_input)
      if #next_input > 0 then
        table.insert(messages, { role = 'user', content = next_input })
      end
      return { messages = messages }
    end, input)
  end,
}

require('model').setup({
  prompts = {
    lmstudio = lmstudio_prompt,
    commit = lmstudio_commit_message,
    ask = lmstudio_ask,
    oask = ollama_ask,
  },
  default_prompt = lmstudio_prompt,
  chats = {
    lmstudio = lmstudio_chat,
    ollama = ollama_chat,
  },
})
