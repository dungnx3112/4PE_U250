$files = @("int4_decoder_blocks.cpp", "swiftkv_attention.cpp")

foreach ($file in $files) {
    $content = Get-Content $file -Raw
    
    # Simple regex to replace PIPELINE inside lane loops with UNROLL
    $content = [regex]::Replace($content, '(?m)(for\s*\(\s*int\s*lane\s*=\s*0\s*;\s*lane\s*<\s*(INT4_OUTPUTS_PER_WORD|SWIFTKV_HEAD_SIZE/2)\s*;\s*\+\+lane\s*\)\s*\{\s*)#pragma\s+HLS\s+PIPELINE\s+II=1', '$1#pragma HLS UNROLL')
    
    Set-Content $file -Value $content
}
