#!/bin/bash

# 遍历当前目录下的所有文件
for file in *; do
    # 判断文件是否为jpg文件（包括伪JPG文件）
    if [[ -f "$file" && "$file" == *.jpg ]]; then
        # 检查文件的实际类型
        file_type=$(file --mime-type -b "$file")
        
        # 如果文件的实际类型不是image/jpeg（即伪JPG文件）
        if [[ "$file_type" != "image/jpeg" ]]; then
            # 输出文件被识别为伪JPG
            echo "File $file is not a valid JPEG image. Converting it..."
            
            # 使用 ImageMagick 的 convert 命令将文件转换为真实的 JPG
            convert "$file" "$file"
            echo "Converted $file to a valid JPEG file."

            # 删除原始伪JPG文件（此时文件已经是一个有效的JPG）
        else
            echo "$file is a valid JPEG file."
        fi
    fi
done

