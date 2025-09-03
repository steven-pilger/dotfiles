function run_aider
    clear &&
    OPENAI_API_BASE=http://127.0.0.1:8012 \
    aider \
        --openai-api-key NONE \
        --model-metadata-file $HOME/.config/aider/aider.model.metadata.json \
        --model openai/qwen2.5-coder-7b \
        --no-gitignore \
        --watch-files
end
