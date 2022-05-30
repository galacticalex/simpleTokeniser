
<!-- 
# SPDX-FileCopyrightText: 2022 Orcro Ltd. <team@orcro.co.uk>
# 
# SPDX-LicenseIdentifier: Apache-2.0
-->

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

`myvariable()` (the parens are not included), it would in fact be parsed as _myvariable_

## Quick use

Load the script into a text editor.
Modify the variables in the box (lines 15, 20, and 21).
Save the script with a nice name, such as `tokeniser_set.R`
Run the script from the shell/from an IDE.

## Licensing

> Copyright © 2022 Orcro Ltd.

This script and the accompanying materials are made available under the terms of the Apache License Version 2. A copy of the licence is available in `./LICENSES`. 

### Dependencies

This script must be run on an R interpreter.

## Contact

:house: Orcro Limited team@orcro.co.uk

:hammer: Maintainer alexander.murphy@orcro.co.uk
