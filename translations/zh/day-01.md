# 第1天: 使用 AI 构建和部署您的模因币网站

## 目标
- 使用 Grok 4 进行初步研究、创建提示和通过递归提示头脑风暴病毒式 memecoin 想法，专注于构建强大的叙述，产生可以粘贴到 Cursor 中的提示。
- 使用 Grok 4 或轻量使用 ChatGPT 为您的 memecoin 网站生成 X 横幅、适用于 DexScreener 和 DexTools 的单个 DEX 横幅以及以吉祥物为重点的徽标。
- 使用 Cursor AI 生成和迭代 memecoin 网站的单个静态 HTML 页面（`index.html`），嵌入所有 HTML、CSS（在 `<style>` 中）和 JavaScript（在 `<script>` 中），包含关键元素：英雄部分、代币经济学、路线图、购买指南、社区链接（用于 X、TG、DexScreener）、购买按钮（Raydium 占位符）和迷因画廊，灵感来自顶级 Solana memecoin 网站。
- 将网站和图像部署到 GitHub Pages，获得实时公共 URL，每次推送时自动更新（在单独的发布步骤中涵盖）。
- 了解 memecoin 网站组件以及 AI 如何加速 Web 开发。
- 学习递归提示：使用 AI 生成/改进提示，然后用于创建图像或代码。
- （发布步骤）学习使用 Cursor 生成 SSH 密钥并为部署设置 GitHub 身份验证（无需手动命令）。

## 先决条件
- **工具：** 安装 [Cursor](https://cursor.com/)，可选择 [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) 或免费替代品（如 GIMP）进行图像编辑。（Node.js 和 Git 在发布步骤之前是可选的）
- **账户：** 创建 [GitHub](https://github.com/) 账户、[Grok 4](https://grok.com/)（通过 Premium+ 或 SuperGrok 订阅获得高级功能，如图像生成）、可选的 [ChatGPT](https://chat.openai.com/)（用于 DALL-E，轻量使用）
- **知识：** 基础 HTML（如 `<div>` 标签）、CSS（如样式颜色）、JavaScript（如简单函数）
- **注意：** 今天避免域名购买等费用。使用免费的 GitHub Pages URL（`yourusername.github.io/memecoin-site`）。使用 Grok 4 生成图像需要订阅；轻量使用 ChatGPT 作为备用。Photoshop 需要订阅（约 $20/月）或使用 GIMP 等免费工具。代币将在后续几天在 LetsBonk.fun（Solana memecoin 启动平台）上启动—今天的重点是网站。

## 设置：为您的项目配置 Cursor
**目标：** 设置 Cursor 作为您的主要 AI 编码工具，创建本地文件夹，将其添加到工作区，并使用提示框进行生成。

1. **安装并打开 Cursor：**
   - 从 [cursor.com](https://cursor.com/) 下载并安装 Cursor
   - 打开 Cursor—它看起来像 VS Code，但具有 AI 功能，如 Composer（用于代码生成）和 Chat（用于对话）

2. **创建本地文件夹：**
   - 在文件资源管理器中创建文件夹：`mkdir memecoin-site-day1`
   - 在 Cursor 中打开：File > Open Folder > 选择 `memecoin-site-day1`

3. **添加到工作区：**
   - 在 Cursor 中，转到 View > Command Palette（Ctrl+Shift+P 或 Cmd+Shift+P），搜索"Workspaces: Add Folder to Workspace"，选择您的 `memecoin-site-day1` 文件夹
   - 这允许 Cursor 访问文件夹进行 AI 操作（例如，在其中生成文件）

4. **使用提示框（Composer）：**
   - 使用 Ctrl+Shift+I（或 Mac 上的 Cmd+Shift+I）打开 Composer
   - 输入自然语言提示（例如"Generate a hello world HTML file"）—Cursor 将根据您的请求创建/编辑文件
   - 对于 Chat：打开 Chat 侧边栏（图标或 Ctrl+Shift+L）进行问题或改进

5. **提示：** Cursor 使用 GPT-4 或 Claude 等模型—如需要在设置中配置。使用 Composer 进行代码脚手架，Chat 进行头脑风暴

6. **寻求帮助的提示：**
   - 询问 Cursor Chat："How do I set up a new project folder in Cursor and use Composer for code generation?"

## 任务和说明
按照这些步骤使用 Grok 4 进行头脑风暴，生成图像/文本，在 Cursor 中构建和迭代您的 memecoin 网站，并使用 Cursor AI 改进您的网站。专注于使用 Grok 4 进行研究/提示，使用 Cursor 进行脚手架；如果 Grok 4 的图像生成有限，轻量使用 ChatGPT 进行图像处理。Git 相关步骤（发布）是分开的，通过 Cursor 提示处理。

### 任务 1：递归提示介绍
**目标：** 学习递归提示—一种技术，您使用 AI 生成或改进提示，然后使用该改进的提示创建其他内容（如图像或代码）。这迭代地构建更好的结果并教授 AI 链式处理。

1. **什么是递归提示？**
   - 就像要求 AI 帮助您提出更好的问题。例如，从基本想法开始（"a rocket logo"），使用 AI 制作详细提示（"cartoon rocket with smiling face, blue/yellow, high-res"），然后在另一个 AI 工具中使用该提示生成徽标
   - 为什么？AI 改进的提示会产生更精确、更有创意的输出。这是 AI 工程中优化结果而不手动调整的关键

2. **使用 Cursor 或 Grok 4 练习：**
   - 打开 Cursor Chat 或 Grok 4 并提示："Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
   - AI 可能输出："Generate a vibrant, cartoon-style logo for 'GrokCoin' featuring a rocket ship with a cute smiling face blasting through space, surrounded by stars and planets, in bright blue and yellow tones, high resolution, square format, transparent background."
   - 复制这个改进的提示并在任务 3 中用于图像生成

3. **应用到网站代码（可选预览）：**
   - 提示 Cursor："Create a refined prompt for generating a Next.js homepage for a memecoin site."
   - 在训练营的后续部分使用输出—今天专注于头脑风暴和图像

4. **提示：** 递归提示节省时间；链接 2-3 次迭代以获得最佳结果（例如，生成提示 > 用反馈改进 > 最终使用）

### 任务 2：使用 Grok 4 和递归提示头脑风暴 Memecoin 想法
**目标：** 使用 Grok 4 进行初步研究和头脑风暴 10 个病毒式 memecoin 想法，基于您指定的个人想法（例如"关于我的柴犬狗 Kylie 的 memecoin"）。通过围绕社区、迷因和趋势构建强大叙述来专注于病毒性。使用递归提示来改进和选择概念（代币名称、符号、叙述），产生可以粘贴到 Cursor 中的提示。理解"元"与其他概念。

1. **理解"元"与其他 Memecoin 概念：**
   - **元 Memecoins：** 这些反映了当前病毒式传播或流行的内容，触及 X、TikTok、政治或加密文化中的趋势话题（例如，关于 memecoins、当前趋势或讽刺如"CoinAboutCoins"的硬币）。它们通过幽默、及时引用（例如 2025 年选举迷因）和平台特定的内部笑话病毒式传播，在社交媒体上快速传播。示例：PEPE（青蛙迷因元）利用了文化趋势
   - **动物概念（如狗、动物）：** 这些依赖于可爱/相关的主题（如 Dogecoin 的柴犬狗用于乐趣/忠诚）。它们通过情感吸引力、社区空投和代言病毒式传播（如 Elon Musk 对 DOGE）。在 2025 年，像 Dogwifhat（WIF）这样的动物硬币通过可分享的吉祥物取得成功，但面临饱和—元硬币通过与当前炒作保持一致而脱颖而出
   - **病毒性提示：** 瞄准具有强大叙述（故事 + 情感）、迷因潜力（可重新混合的内容）和社区钩子（空投、竞赛）的概念。元概念在趋势上蓬勃发展（如 X 标签 #SolanaSzn）；动物概念需要新鲜角度以避免疲劳

2. **访问 Grok 4：**
   - 访问 [grok.com](https://grok.com/) 或 X 应用，登录（需要 Premium+ 或 SuperGrok 获得 Grok 4）

3. **使用 Grok 4 进行初步研究：**
   - 提示 Grok 4："Research successful viral memecoin concepts from 2025 (as of 02:45 PM CDT, August 02, 2025). What makes them viral? Provide 5 examples with token name, symbol, narrative, and key success factors (e.g., community, memes). Compare 'meta' (trending topics) concepts vs. animal-themed ones like dogs."
   - 使用见解来指导您的头脑风暴（例如，像 PEPE 这样的元硬币在趋势上蓬勃发展；像 DOGE 这样的狗硬币在代言上）

4. **从您的想法开始：**
   - 决定个人主题（例如"关于我的柴犬狗 Kylie 的 memecoin"或"关于 AI 工程师的 memecoin"）
   - 在 Grok 4 中使用递归提示："Generate a refined prompt for brainstorming 10 viral memecoin ideas based on: [your idea]. Emphasize virality through strong narratives, meme potential, community engagement, and current trends on X or TikTok. Include token name, symbol, and narrative for each, highlighting if it's 'meta' or animal-themed. Format the output as a single prompt to paste into Cursor for website generation."

5. **使用 Grok 4 进行头脑风暴：**
   - 将改进的提示粘贴到 Grok 4 中
   - Grok 将输出 10 个想法，例如：
     - 想法 1（动物主题）：代币名称：KylieShib，符号：KYL，叙述："KylieShib 是柴犬爱好者的终极狗狗币！受您忠诚的 Kylie 启发，这个 memecoin 庆祝毛茸茸的冒险和与 #DogTok 趋势相关的空投。加入迷因竞赛—通过可爱的幼犬视频病毒式传播！"
     - 想法 2（元）：代币名称：KylieMeta，符号：KMT，叙述："KylieMeta 嘲笑 2025 年的加密炒作！柴犬 Kylie '元狗'用讽刺嘲笑 TikTok 拉盘和抛售。叙述：与 #SolanaSzn 趋势的硬币—通过 X 讽刺病毒式传播！"
   - 审查想法，比较元（趋势、可持续炒作）与动物（可爱、快速病毒性但有潮流风险）

6. **递归改进选择：**
   - 如果需要，提示 Grok 4："Refine my top 3 memecoin ideas from the list to maximize virality: Strengthen narratives with current X/TikTok trends, meme templates, and LetsBonk integration. Explain why a meta concept might outperform animal ones in 2025."
   - 最终确定病毒概念（代币名称、符号、叙述），具有强大叙述（如故事 + 迷因 + 趋势）—用其更新所有后续任务

7. **寻求帮助的提示：**
   - 询问 Cursor Chat："Help me select the most viral memecoin concept from Grok 4's brainstorm list, focusing on narrative strength and meta vs. animal tradeoffs."

### 任务 3：使用 AI 生成 X 横幅、DEX 横幅和徽标（Grok 4 和 ChatGPT）
**目标：** 使用 Grok 4 和 ChatGPT 为您的 memecoin 网站创建 X 横幅、适用于 DexScreener 和 DexTools 的单个 DEX 横幅以及以吉祥物为重点的徽标。在 Grok 4 中使用递归提示来改进提示，并在发布之前本地存储图像。注意图像可能需要在 Photoshop 或免费替代品中编辑。

1. **选择您的 AI 工具：**
   - **Grok 4：** 使用 [grok.com](https://grok.com/) 或 X 应用进行初步提示改进和图像生成（通过 Grok 4 中的 Aurora 或类似功能）
   - **ChatGPT（DALL-E）：** 如果 Grok 4 的输出有限，使用 [chat.openai.com](https://chat.openai.com/) 进行最终图像生成（需要 Plus 订阅）

2. **在 Grok 4 中使用递归提示改进提示：**
   - 提示 Grok 4："Generate a refined prompt for a mascot-focused logo based on [your narrative]. Example: Cute Shiba dog with accessories."
   - 改进输出示例："Generate a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in bright red and white colors. High resolution, square format (e.g., 500x500 pixels), transparent background, PNG format."

3. **生成徽标：**
   - 将改进的提示粘贴到 Grok 4 中进行初步生成。如果不满意，在 ChatGPT 中改进："Create a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in red and white, 500x500 pixels, transparent PNG."
   - 下载为 `logo.png`

4. **生成 X 横幅：**
   - 改进提示（使用 Grok 4 改进）："Create a banner image for an X (Twitter) profile for '[your token name]'. Feature the mascot, tagline based on [your narrative], and elements like [theme, e.g., dogs in space]. High resolution, 1500x500 pixels, PNG format."
   - 使用 Grok 4，然后如需要在 ChatGPT 中改进："Design an X banner for 'KylieShib' with a Shiba dog mascot, 'Loyal to the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - 下载为 `x-banner.png`

5. **生成 DEX 横幅（用于 DexScreener 和 DexTools）：**
   - 改进提示："Create a banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. High resolution, 1500x500 pixels, PNG format."
   - 使用 Grok 4，然后如需要在 ChatGPT 中改进："Create a DEX banner for 'KylieShib' with a Shiba dog mascot, 'To the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - 下载为 `dex-banner.png`

6. **使用 Photoshop 或免费替代品进行图像编辑：**
   - **为什么编辑？** AI 生成的图像可能需要裁剪（如移除不需要的背景）、调整大小（如徽标精确 500x500）或添加排版（如代币名称/符号）。Photoshop 提供高级工具；GIMP 是免费选项
   - **步骤：**
     - 在 Photoshop 或 GIMP 中打开每个图像（如 `logo.png`）
     - **裁剪背景：** 使用"Magic Wand"或"Lasso"工具选择并移除不需要的区域，细化边缘
     - **调整大小：** 转到"Image > Image Size"，将徽标设置为 500x500 像素，横幅设置为 1500x500 像素
     - **添加排版：** 使用"Text"工具添加"[your token name]"或标签行（如果缺失），匹配主题（如粗体红色字体）
     - **保存：** 导出为 PNG，透明背景（File > Export As > PNG）

7. **本地存储图像：**
   - 在您的 `memecoin-site-day1` 目录中创建 `assets` 文件夹
   - 将编辑后的 `logo.png`、`x-banner.png` 和 `dex-banner.png` 移动到 `assets`
   - **注意：** 图像将在发布步骤中部署到 GitHub Pages—现在保持本地

8. **寻求帮助的提示：**
   - 如果工具不工作，询问 Cursor Chat："How to generate images with Grok 4 and ChatGPT? Provide sample prompts for a memecoin mascot logo, X banner, and DEX banner."

### 任务 4：从顶级 Solana Memecoins 获得灵感搭建 Memecoin 网站
**目标：** 创建包含所有 HTML、CSS（在 `<style>` 中）和 JavaScript（在 `<script>` 中）的单个 `index.html` 文件用于 memecoin 网站，整合您的 AI 生成的图像 URL。在 Cursor 中使用递归提示来改进代码提示，从顶级 Solana memecoin 网站获得灵感，利用图像中的颜色。

1. **使用 Grok 4 研究灵感：**
   - 提示 Grok 4："Suggest 5 top-performing memecoin websites on Solana from 2025 (as of 02:45 PM CDT, August 02, 2025). Provide their URLs, key design features (e.g., bold hero, meme galleries), and why they work for viral marketing."
   - 示例输出："1. bonk.in - Bold hero with mascot, meme gallery, vibrant colors. 2. wifcoin.sol - Animated roadmap, community section, neon palette. 3. pepe.lol - Satirical design, tokenomics table, dark theme. 4. shibarmy.com - Dog-themed layout, how-to-buy guide, playful fonts. 5. metadog.io - Meta-narrative focus, interactive elements, sleek design."
   - 注意这些见解用于您的设计

2. **在 Cursor 中使用递归提示改进提示：**
   - 打开 Cursor Chat 并提示："Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links (X, TG, DexScreener placeholders), a buy button (placeholder for Raydium), and responsive meme gallery, inspired by top Solana memecoin designs (e.g., bonk.in, wifcoin.sol). Use a color palette from [describe images, e.g., red and white for Shiba theme]."
   - Cursor 将输出改进的提示，例如"Use primary color #FF0000 for backgrounds, secondary #FFFFFF for accents."

3. **打开 Cursor Composer：**
   - 打开 Composer（Ctrl+Shift+I 或 Cmd+Shift+I）

4. **将改进的提示粘贴到 Cursor Composer：**
   - 将 Cursor Chat 的改进提示粘贴（替换为本地图像路径，如 `assets/logo.png`，和您选择的概念；在发布时更新为 GitHub URL）：
     ```
     Generate a single static HTML page (index.html) for a memecoin called "[your token name]" with all HTML, CSS (in <style> tags), and JavaScript (in <script> tags). Include:
     - A bold hero section with coin name, tagline based on [your narrative], mascot logo image (use this URL: assets/logo.png), and a placeholder buy button for Raydium (href='https://raydium.io/swap/?inputMint=sol&outputMint=[your-token-mint]').
     - A vibrant tokenomics section with a table (e.g., total supply: 1B tokens, distribution: 50% community, 30% dev, 20% marketing).
     - An interactive roadmap section with a timeline (e.g., Q1 2025: Launch on LetsBonk, Q2: Exchange listings).
     - A clear how-to-buy guide with steps (e.g., "Get Phantom Wallet, Buy SOL, Swap on LetsBonk.fun").
     - A community section with placeholder links to X (href='https://x.com/[yourhandle]'), TG (href='https://t.me/[yourchannel]'), and DexScreener (href='https://dexscreener.com/solana/[token-mint]').
     - A responsive meme gallery with 4 placeholder images in a grid (use URLs like https://via.placeholder.com/300x300).
     Use semantic HTML, a responsive design (mobile-friendly), and a fun aesthetic leveraging the color palette from my images (e.g., primary: #FF0000, secondary: #FFFFFF), inspired by top Solana memecoin designs. Ensure all code is in one index.html file.
     ```
   - Cursor 将在您的 `memecoin-site-day1` 文件夹中生成 `index.html`，包含嵌入的 `<style>` 和 `<script>` 部分，使用图像中的颜色和灵感设计。保存它

5. **审查代码：**
   - 在 Cursor 中打开 `index.html`。验证 `<section id="hero">`、`<table id="tokenomics">` 等部分存在，徽标、社交链接和购买按钮通过本地路径加载（在发布时更新为 GitHub URL）
   - 检查 `<style>` 的响应性、颜色使用（如 `background: #FF0000;`）和受 Solana 启发的元素（如鲜艳的布局）
   - 检查 `<script>` 的基本交互性（如控制台日志或事件监听器）

6. **本地测试：**
   - 在浏览器中打开 `index.html`（双击或在终端中运行 `open index.html`）
   - 确保所有部分正确显示，徽标加载，颜色匹配图像，并且移动端响应（调整浏览器大小）。如有问题，询问 Cursor Chat："Fix my HTML/CSS layout in index.html or image loading errors."

### 任务 5：迭代网站
**目标：** 使用 AI 生成的改进来增强单页网站，提高交互性、设计和从顶级 Solana memecoins 获得额外灵感。迭代涉及用新方向重新生成或进行小改进，如微妙动画、按钮样式或排版更改，全部通过提示工程。

1. **迭代指导：**
   - **用新方向重新生成：** 如果初始设计感觉不对，提示 Cursor 用新风格重新开始（如"Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design"）
   - **进行小改进：** 用提示进行增量改进：
     - 添加微妙动画效果（如"Add a fade-in animation to the hero section"）
     - 改进按钮样式（如"Enhance the buy button with a gradient background and rounded corners"）
     - 更改排版（如"Update all headings to use a bold, playful font inspired by shibarmy.com"）
   - 使用 Composer 进行有针对性的提示，避免覆盖整个文件（如"Update only the <style> tag..."）
   - 每次更改后测试，确保功能性和美学与您的愿景一致

2. **添加交互性：**
   - 在 Composer 中提示 Cursor："Add JavaScript in my index.html <script> tag to show an alert when clicking community links (e.g., 'Join our community!')."

3. **增强设计：**
   - 在 Composer 中提示 Cursor："Enhance my index.html <style> tag with a subtle fade-in animation for the hero section, inspired by wifcoin.sol."

4. **改进购买按钮：**
   - 在 Composer 中提示 Cursor："Improve the buy button in my index.html hero section with a gradient background and rounded corners, ensuring mobile-friendliness."

5. **调整排版：**
   - 在 Composer 中提示 Cursor："Change all headings in my index.html to use a bold, playful font inspired by shibarmy.com."

6. **本地保存：**
   - 保存对 `index.html` 的更改

7. **验证更新：**
   - 在浏览器中重新打开 `index.html` 查看更改

8. **寻求帮助的提示：**
   - 如需要，询问 Cursor Chat："Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

### 任务 6：了解 Memecoin 网站和 AI
**目标：** 了解 memecoin 网站元素的用途以及 AI 如何简化开发。

1. **提示 Cursor 进行解释：**
   - 询问："Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
   - 预期回答：
     - Hero：用大胆的品牌吸引注意力
     - Tokenomics：通过透明的供应/分配建立信任
     - Roadmap：展示未来计划以激发投资者
     - How-to-buy：简化新用户的入门
     - Community：通过社交平台推动参与
     - Meme gallery：使用幽默实现病毒传播

2. **AI in Web3 测验：**
   - 提示 Cursor："Create a 3-question quiz about how AI helps build websites, generate images, and manage socials, with answers. Example: How does Grok 4 or Cursor make image creation easier?"
   - 示例回答：
     - Q: How does AI like Grok 4/Cursor help with images? A: Generates logos, banners, and memes from text prompts.
     - Q: What's an AI prompt for socials? A: A request like "Write a tweet for a memecoin launch."
     - Q: How is AI changing web dev? A: Speeds up coding, asset creation, and social automation.

3. **反思：** 在 Cursor 中创建 `notes.txt` 并写入："How did AI help me with brainstorming, images, and site today?"（如"Grok 4 brainstormed ideas, Cursor scaffolded the site!"）。本地保存

### 任务 7：发布到 GitHub Pages
**目标：** 使用 Cursor 生成 SSH 密钥并设置 GitHub 身份验证来部署您的网站和图像到 GitHub Pages（无需手动命令）。

1. **使用 Cursor 生成 SSH 密钥：**
   - 打开 Cursor Chat 并提示："Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
   - 按照 Cursor 的说明（例如，它可能指导您到 Cursor 内的终端，生成 `id_rsa` 和 `id_rsa.pub` 等密钥，并提示您将公钥复制到 GitHub 的 Settings > SSH and GPG keys > New SSH key）

2. **使用 Cursor 设置 GitHub 身份验证：**
   - 提示 Cursor："Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
   - 按照 Cursor 的指导（例如，它可能建议创建名为 `memecoin-site-day1` 的仓库，链接它，并用"Push my local memecoin-site-day1 folder to GitHub"等提示推送）

3. **部署到 GitHub Pages：**
   - 提示 Cursor："Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
   - Cursor 将指导您到 GitHub Settings > Pages，将源设置为 `main` 分支，`/ (root)` 文件夹，并在 `https://yourusername.github.io/memecoin-site-day1` 验证部署

4. **更新图像 URL：**
   - 部署后，提示 Cursor："Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
   - 保存并本地测试更新后的 `index.html`

5. **寻求帮助的提示：**
   - 如有问题，询问 Cursor Chat："Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## Day 1 的 Cursor 提示
查看课程仓库中的 `docs/daily_prompts.md` 获取完整列表

- **递归提示：**
  - "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
  - "Refine this prompt for generating a single-page HTML memecoin website: Basic hero and tokenomics sections."
  - "Refine this prompt for an X banner: Space-themed banner for [your token name]."
  - "Suggest 5 top-performing memecoin websites on Solana from 2025. Provide their URLs, key design features, and why they work for viral marketing."
  - "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links, a buy button, and responsive meme gallery, inspired by top Solana memecoin designs."

- **图像生成（Grok 4/ChatGPT）：**
  - "Generate a fun, vibrant mascot-focused logo for a memecoin called '[your token name]'. [Description from narrative, e.g., cute Shiba dog with laser eyes]. High resolution, 500x500 pixels, transparent background, PNG format."
  - "Create a banner image for an X profile for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Create a single banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Generate a small square image (400x400 pixels) for a tweet about '[your token name]' showing the mascot with a 'LFG LetsBonk!' text overlay, matching [your narrative]. PNG format."

- **脚手架：**
  - "Generate a single static HTML page (index.html) for a memecoin called '[your token name]' with all HTML, CSS (in <style>), and JavaScript (in <script>). Include a bold hero section (coin name, tagline, logo URL, and a placeholder buy button), vibrant tokenomics table (1B supply, 50% community, 30% dev, 20% marketing), interactive roadmap timeline, clear how-to-buy guide, community links, and responsive meme gallery (4 placeholder URLs). Use semantic HTML, responsive design, and a fun aesthetic."
  - "Add semantic HTML to my index.html for a memecoin site with clear section IDs."
  - "Embed CSS in my index.html <style> tag for a mobile-responsive design inspired by top Solana memecoins."

- **迭代：**
  - "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design."
  - "Add a subtle fade-in animation to the hero section of my index.html."
  - "Enhance the buy button in my index.html with a gradient background and rounded corners."
  - "Update all headings in my index.html to use a bold, playful font inspired by shibarmy.com."
  - "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

- **理解：**
  - "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
  - "What is a memecoin? Explain tokenomics and roadmaps in simple terms."
  - "How does Cursor AI speed up web development? Give 3 examples."
  - "How can AI like Grok 4 or Cursor generate images and tweets for memecoin projects?"

- **发布：**
  - "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
  - "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
  - "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
  - "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
  - "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## 学习成果
- 使用 Grok 4 和递归提示头脑风暴病毒式 memecoin 想法，选择具有强大叙述的概念，并使用 Grok 4 进行初步研究/提示创建，产生用于 Cursor 的提示
- 使用 Grok 4 和 ChatGPT 生成 X 横幅、DEX 横幅和以吉祥物为重点的徽标，使用递归提示进行改进，在 Photoshop/GIMP 中编辑，并本地存储
- 使用 Cursor AI 构建和迭代单页 memecoin 网站（`index.html`），粘贴来自 Grok 4 的改进提示，从顶级 Solana memecoin 设计获得灵感，包括社交链接和购买按钮
- 使用 Cursor 的 Composer 和 Chat 生成代码和解决问题
- 学习递归提示以获得更好的 AI 输出
- （发布步骤）学习使用 Cursor 生成 SSH 密钥并设置 GitHub 身份验证进行部署

## 下一步
- 在 `memecoin-site-day1` 文件夹中本地保存您的工作
- 通过在浏览器中打开 `index.html` 验证您的本地网站
- 明天（Day 2）：深入使用 AI 构建您的 Memecoin 社区，可能设置 Telegram 和 X 来扩展您项目的覆盖范围 