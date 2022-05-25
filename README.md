# simpleTokeniser

Disassemble 2 code files into individual variables names, function names, etc. and compare them.

## How it works

Taking a text-based input file parsed as a single string, each *word* is tokenised and stored as an R character variable. This can be used to compare expression definitions from one file to another.

It's like running *find-within-page* in your browser, for every word simultaneously from an input file.

## *word*s

Examples of words that are tokenised

`my-variable`
`myVariable`
`my_variable`
`myFunctionname`
`my123function`

Examples of words that are not tokenised

`my-variable()` (the parens are not included)
