# 12306plus

12306增强功能集合。

## 12306余票票价显示与最低价高亮油猴脚本

- 文件：`userscripts/12306-ticket-price.user.js`
- 功能：
  - 在12306查询页面的每个座席单元格中显示票价，并在原文字下方追加价格行。
  - 自动寻找每一列中的最低价（不含候补），并以黄色背景高亮。
- 安装方法：
  1. 安装 Tampermonkey、Violentmonkey 等油猴插件。
  2. 在插件中创建脚本，将本仓库中的脚本内容复制进去，或使用 Greasy Fork 上的脚本链接。
  3. 保存后访问 12306 查询页面即可生效。
- 更新：
  - 脚本包含 `@downloadURL` 和 `@updateURL`，可在 Greasy Fork 获取自动更新。

欢迎提交 issue 或 PR 来改进脚本。
