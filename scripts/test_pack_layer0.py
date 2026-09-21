import os
import json
import time
import numpy as np
from safetensors import safe_open

MODEL_DIR = "C:/KLTN/4PE_U250/Llama-2-7b-chat-hf"

print("[Test] Opening safetensors index...")
with open(os.path.join(MODEL_DIR, "model.safetensors.index.json")) as f:
    idx = json.load(f)["weight_map"]

print(f"[Test] Found {len(idx)} tensors.")
st_files = {}
for sf in set(idx.values()):
    st_files[sf] = safe_open(os.path.join(MODEL_DIR, sf), framework="pt")

def get_tensor(name):
    sf = idx[name]
    return st_files[sf].get_tensor(name).float().numpy()

t0 = time.time()
q_weight = get_tensor("model.layers.0.self_attn.q_proj.weight")
print(f"[Test] Loaded Layer 0 Q shape: {q_weight.shape} in {time.time() - t0:.2f}s")
print(f"[Test] Min: {q_weight.min():.4f}, Max: {q_weight.max():.4f}, Mean abs: {np.abs(q_weight).mean():.4f}")
