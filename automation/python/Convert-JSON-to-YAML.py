import json
import argparse

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("folder_path", help="Input Folder path where JSON file is stored.")

    args = parser.parse_args()
    file_path = args.folder_path
    print(file_path)
    
    with open(file_path, 'r+', encoding='utf-8') as f:
        # data = json.loads(f.read())
        data = f.read()
    
    json_data = json.loads(data)
    print(data)
