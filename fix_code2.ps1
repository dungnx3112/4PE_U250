$content = Get-Content int4_decoder_blocks.cpp -Raw

# Add PIPELINE II=1 to word loops
$content = [regex]::Replace($content, '(?m)(for\s*\(\s*int\s*(word|word_in_group)\s*=\s*0\s*;\s*\2\s*<\s*[^;]+;\s*\+\+\2\s*\)\s*\{\s*)(?!#pragma)', '$1#pragma HLS PIPELINE II=1`n        ')

Set-Content int4_decoder_blocks.cpp -Value $content
