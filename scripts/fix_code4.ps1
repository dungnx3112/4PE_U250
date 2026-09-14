$content = Get-Content int4_decoder_blocks.cpp -Raw

$content = [regex]::Replace($content, '(?m)(for\s*\(\s*int\s*lane\s*=\s*0\s*;\s*lane\s*<\s*(INT4_OUTPUTS_PER_WORD|SWIFTKV_HEAD_SIZE/2)\s*;\s*\+\+lane\s*\)\s*\{\s*)#pragma\s+HLS\s+PIPELINE\s+II=1', '$1#pragma HLS UNROLL')

$content = [regex]::Replace($content, '(?m)(for\s*\(\s*int\s*(word|word_in_group)\s*=\s*0\s*;\s*\2\s*<\s*[^;]+;\s*\+\+\2\s*\)\s*\{\s*)(?!#pragma)', '$1#pragma HLS PIPELINE II=1' + "`r`n        ")

Set-Content int4_decoder_blocks.cpp -Value $content
