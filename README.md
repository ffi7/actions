# Actions

> 自动化脚本

> Plan ↻: 自动更新订阅文件

## Plan X

> No Image

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

## 参考资料

> GITHUB.COM

> SEARCH.BING.COM

> SEARCH.GOOGLE.COM
