# Workflow

> 自动化脚本

> Plan A: 自动更新订阅文件

> Plan B: Visual Studio Code 使用 Visual Studio 编译套件

## Plan X

> ![image](https://user-images.githubusercontent.com/78424351/230357684-95def461-6592-4fa9-9095-2093dbe5aaac.png)

## GitHub Action Library

> Pause

## 参考代码

> 添加环境变量

```ActionScript
 
  jobs: 
    job1:
      runs-on: ubuntu-latest
      outputs:
          val: ${{steps.vals.outputs.test}}
      steps: 
        - id: vals
          run: echo "test=hello" >> "$GITHUB_OUTPUT"
    job2:
      runs-on: ubuntu-latest
      needs: job1
      steps:
        - env:
            v: ${{needs.job1.outputs.val}}
          run: echo "$v world."

```

> 获得日期时间

```ActionScript

  run: echo $(date +'%Y-%m-%d')

```

> 使用Token

```ActionScript

  git clone https://${{ github.actor }}:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }} .
  git remote set-url origin https://${{ github.actor }}:${{ secrets.GITHUB_TOKEN }}@github.com/${{ github.repository }}

```

> 使用脚本

```ActionScript

  chmod +x script.sh
  git update-index --chmod=+x script.sh

```

> [CL](https://github.com/Simple-2021/Workflow/blob/main/CL.ps1)(引用 VsDevCmd 启动 Visual Code)

```Bat

@echo off
chcp 65001 > nul
call  "D:\Program Files\Microsoft\Visual Studio\Community\Common7\Tools\VsDevCmd.bat"
start "" code
exit /B 0

```

## 参考资料

> GITHUB.COM

> SEARCH.BING.COM

> SEARCH.GOOGLE.COM
