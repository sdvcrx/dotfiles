local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   -- webdev stuff
   --b.formatting.deno_fmt,
   --b.formatting.prettier,

   -- Lua
   b.formatting.stylua,

   -- Go
   b.formatting.gofmt,
   b.formatting.goimports,
}

null_ls.setup {
   sources = sources,
}
