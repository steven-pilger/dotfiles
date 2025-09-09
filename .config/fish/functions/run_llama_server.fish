function run_llama_server
    llama-server \
        -hf ggml-org/Qwen2.5-Coder-7B-Q8_0-GGUF \
        --port 8012 \
        --prio 3 \
        --mlock \
        --gpu-layers 99 \
        --batch-size 1024 \
        --ubatch-size 1024 \
        --ctx-size 0 \
        --cache-reuse 256
end
