if true then
  return {}
end

return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup({
      -- Providers must be explicitly added to make them available.
      providers = {
        -- anthropic = {
        --   api_key = os.getenv "ANTHROPIC_API_KEY",
        -- },
        -- gemini = {
        --   api_key = os.getenv "GEMINI_API_KEY",
        -- },
        -- groq = {
        --   api_key = os.getenv "GROQ_API_KEY",
        -- },
        -- mistral = {
        --   api_key = os.getenv "MISTRAL_API_KEY",
        -- },
        -- pplx = {
        --   api_key = os.getenv "PERPLEXITY_API_KEY",
        -- },
        -- provide an empty list to make provider available (no API key required)
        -- ollama = {},
        ollama = {
          endpoint = "http://ai-llm.intemotech.com:14000/api/chat",
          -- endpoint = "192.168.0.63:11434/api/chat",
          topic = {
            model = "deepseek-r1:32b",
            params = { max_tokens = 1600 },
          },
        },
        -- openai = {
        --   api_key = os.getenv "OPENAI_API_KEY",
        -- },
        -- github = {
        -- 	api_key = os.getenv("GITHUB_TOKEN"),
        -- },
        -- nvidia = {
        --   api_key = os.getenv "NVIDIA_API_KEY",
        -- },
        -- xai = {
        --   api_key = os.getenv "XAI_API_KEY",
        -- },
      },
      hooks = {
        Complete = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please finish the code above carefully and logically.
          Respond just with the snippet of code that should be inserted."
          ]]
          local model_obj = prt.get_model("command")
          prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
        end,
        Optimize = function(prt, params)
          local template = [[
          You are an expert in {{filetype}}.
          Your task is to analyze the provided {{filetype}} code snippet and
          suggest improvements to optimize its performance. Identify areas
          where the code can be made more efficient, faster, or less
          resource-intensive. Provide specific suggestions for optimization,
          along with explanations of how these changes can enhance the code's
          performance. The optimized code should maintain the same functionality
          as the original code while demonstrating improved efficiency.

          ```{{filetype}}
          {{selection}}
          ```

          Optimized code:
          ]]
          local model_obj = prt.get_model("command")
          prt.logger.info("Optimizing selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
        end,
        UnitTests = function(prt, params)
          local template = [[
          I have the following code from {{filename}}:

          ```{{filetype}}
          {{selection}}
          ```

          Please respond by writing table driven unit tests for the code above.
          ]]
          local model_obj = prt.get_model("command")
          prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
          prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
        end,
        ProofReader = function(prt, params)
          local chat_prompt = [[
          I want you to act as a proofreader. I will provide you with texts and
          I would like you to review them for any spelling, grammar, or
          punctuation errors. Once you have finished reviewing the text,
          provide me with any necessary corrections or suggestions to improve the
          text. Highlight the corrected fragments (if any) using markdown backticks.

          When you have done that subsequently provide me with a slightly better
          version of the text, but keep close to the original text.

          Finally provide me with an ideal version of the text.

          Whenever I provide you with text, you reply in this format directly:

          ## Corrected text:

          {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

          ## Slightly better text

          {slightly better text}

          ## Ideal text

          {ideal text}
          ]]
          prt.ChatNew(params, chat_prompt)
        end,
      },
    })
  end,
}
