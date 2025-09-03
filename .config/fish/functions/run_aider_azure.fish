# API versions:
# - o3: 2024-12-01-preview
# - gtp-4o: 2024-02-01
# - gpt-5: 2024-12-02-preview

function run_aider_azure
    clear &&
    # echo -e "/run git diff HEAD~3" |\
    AZURE_API_KEY=(op read op://p5lerwkxuapm33wvmrmeyxuzya/xzcnwxuv7eqrwed5hv2xwxdcvu/azure_api_key) \
    AZURE_API_BASE=(op read op://p5lerwkxuapm33wvmrmeyxuzya/xzcnwxuv7eqrwed5hv2xwxdcvu/azure_api_base) \
    AZURE_API_VERSION=2024-12-01-preview \
    aider \
        --no-check-update \
        --read ~/work/config/AIDER_CONVENTIONS.md \
        --model azure/gpt-5 \
        --no-gitignore \
        --no-auto-commits \
        --no-auto-lint \
        --no-suggest-shell-commands \
        --user-input-color '#000000' \
        --vim \
        --watch-files 
end
