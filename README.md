This is a template repo for CINTA course in SCNU. So, I will use Chinese 🥲.

专用于华南师范大学计算机学院使用 CINTA 教材的课程。将提供基于 LaTex 的作业/考试模板，对于本仓库的内容，欢迎随意使用，分享，提 issue 和 pr。

前期准备：
- 配置好 XeLatex 环境
- 找到喜欢的编辑器，推荐 VSCode + LaTeX Workshop，MacOS 可使用 Texifier（收费）
- 了解基本的 LaTeX 语法，也可参考 Homework 下的 latex 编写
- 为了支持 Latex 中高亮代码，选择使用 minted2 宏包，需要安装 Python 和 Pygments，具体方法请 Google
  - 编译 Latex 时，需要进行两轮编译，第一次编译生成辅助文件，第二次编译生成最终文件（xelatex * 2）
  - 使用 minted 需要使用 `-shell-escape`，为保证兼容性，还是选择两者同时调用（仅调用 minted2 在一些系统可能找不到 latexminted）
  - 如果使用 VsCode，你可以切换到 Pygments 所安装的对应的 Python 解释器。
- 初始的 Latex 环境可能找不到我使用的包，建议全都安装（
  - 内存不够可以看着来，甚至把 cls 中一些花哨的操作/宏包调用删掉都可
- 如果可以，尝试阅读 cls 文件，学习一下对应语法
- 更多报错请 Google 或查阅文档

本仓库现处于建设期，仍有许多问题需要完善，下列出部分 TODO List。

- 将单一 LaTeX 解耦，划分多文档并重新组织项目结构
- 提供一键配置脚本，并于一定程度上简化格式自定义
- 提供 Typst 的模板
