local setup_c = function()
    local ls = require("luasnip")

    -- formatting snippet with angle bracket
    local fmt =  require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    -- repetitive node
    local rep = require("luasnip.extras").rep

    local s = ls.snippet
    local c = ls.choice_node
    local i = ls.insert_node
    local t = ls.text_node

    local snippets = {
        s(
            "stdtype",
            fmt(
[[
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

typedef uint8_t   u8;
typedef uint16_t  u16;
typedef uint32_t  u32;
typedef uint64_t  u64;
typedef size_t    usize;

typedef intptr_t  iptr;
typedef uintptr_t uptr;

typedef int8_t  i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef u32 d_word;

#ifndef null
#define null NULL
#endif
]], 
                {}
            )
        ),
        s(
            "printfln",
            fmta([[printf("<finish>\n");]], { finish = i(0) })
        )
    }

    ls.add_snippets("c", snippets)
end

return setup_c
