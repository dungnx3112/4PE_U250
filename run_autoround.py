import os
import sys
import ctypes

def main():
    dll_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "software_sim", "run_autoround.dll"))
    if not os.path.exists(dll_path):
        print(f"Error: {dll_path} does not exist.", file=sys.stderr)
        sys.exit(1)

    lib = ctypes.CDLL(dll_path)
    args = [sys.argv[0].encode("utf-8")] + [arg.encode("utf-8") for arg in sys.argv[1:]]
    argc = len(args)
    argv_type = ctypes.c_char_p * (argc + 1)
    argv = argv_type(*args, None)

    lib.run_main.argtypes = [ctypes.c_int, argv_type]
    lib.run_main.restype = ctypes.c_int

    ret = lib.run_main(argc, argv)
    sys.exit(ret)

if __name__ == "__main__":
    main()
