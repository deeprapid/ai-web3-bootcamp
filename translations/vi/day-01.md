# Ngày 1: Xây dựng và triển khai website Memecoin với AI

## Mục tiêu
- Sử dụng Grok 4 để nghiên cứu ban đầu, tạo prompt và brainstorm ý tưởng memecoin viral với recursive prompting, tập trung vào việc xây dựng narrative mạnh mẽ, kết quả là một prompt để paste vào Cursor.
- Sử dụng Grok 4 hoặc ChatGPT nhẹ để tạo banner X, một banner DEX duy nhất cho cả DexScreener và DexTools, và logo tập trung vào mascot cho website memecoin của bạn.
- Sử dụng Cursor AI để tạo và lặp lại một trang HTML tĩnh duy nhất (`index.html`) cho website memecoin, nhúng tất cả HTML, CSS (trong `<style>`), và JavaScript (trong `<script>`), với các yếu tố chính: hero section, tokenomics, roadmap, hướng dẫn cách mua, liên kết cộng đồng (cho X, TG, DexScreener), nút mua (placeholder cho Raydium), và gallery meme, lấy cảm hứng từ các website memecoin Solana hàng đầu.
- Triển khai site và hình ảnh lên GitHub Pages để có URL công khai live với cập nhật tự động trên mỗi push (được đề cập trong bước Publishing riêng biệt).
- Hiểu các thành phần website memecoin và cách AI tăng tốc phát triển web.
- Học recursive prompting: Sử dụng AI để tạo/cải thiện prompts sau đó được sử dụng để tạo hình ảnh hoặc code.
- (Bước Publishing) Học cách sử dụng Cursor để tạo SSH keys và thiết lập xác thực GitHub cho deployment (không cần lệnh thủ công).

## Yêu cầu trước
- **Công cụ:** Cài đặt [Cursor](https://cursor.com/), và tùy chọn [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) hoặc thay thế miễn phí (ví dụ: GIMP) để chỉnh sửa hình ảnh. (Node.js và Git tùy chọn cho đến bước Publishing.)
- **Tài khoản:** Tạo tài khoản [GitHub](https://github.com/), [Grok 4](https://grok.com/) (qua Premium+ hoặc SuperGrok subscription cho tính năng nâng cao như image gen), tùy chọn [ChatGPT](https://chat.openai.com/) (cho DALL-E, sử dụng nhẹ).
- **Kiến thức:** HTML cơ bản (ví dụ: thẻ `<div>`), CSS (ví dụ: styling màu sắc), JavaScript (ví dụ: function đơn giản).
- **Lưu ý:** Ngày này tránh chi phí như mua domain. Sử dụng URL GitHub Pages miễn phí (`yourusername.github.io/memecoin-site`). Tạo hình ảnh với Grok 4 cần subscription; sử dụng ChatGPT nhẹ như backup. Photoshop cần subscription (~$20/tháng) hoặc sử dụng công cụ miễn phí như GIMP. Token sẽ được launch trên LetsBonk.fun (Solana memecoin launchpad) trong những ngày sau—trọng tâm hôm nay là website.

## Thiết lập: Cấu hình Cursor cho Dự án của bạn
**Mục tiêu:** Thiết lập Cursor làm công cụ AI coding chính, tạo folder local, thêm vào workspace, và sử dụng prompt box để generate.

1. **Cài đặt và Mở Cursor:**
   - Tải và cài đặt Cursor từ [cursor.com](https://cursor.com/).
   - Mở Cursor—trông giống VS Code nhưng có tính năng AI như Composer (cho code gen) và Chat (cho hội thoại).
2. **Tạo Folder Local:**
   - Trong file explorer, tạo folder: `mkdir memecoin-site-day1`.
   - Mở trong Cursor: File > Open Folder > Chọn `memecoin-site-day1`.
3. **Thêm vào Workspace:**
   - Trong Cursor, vào View > Command Palette (Ctrl+Shift+P hoặc Cmd+Shift+P), tìm "Workspaces: Add Folder to Workspace," và chọn folder `memecoin-site-day1` của bạn.
   - Điều này cho phép Cursor truy cập folder cho AI operations (ví dụ: tạo files bên trong nó).
4. **Sử dụng Prompt Box (Composer):**
   - Mở Composer với Ctrl+Shift+I (hoặc Cmd+Shift+I trên Mac).
   - Gõ natural language prompts (ví dụ: "Generate a hello world HTML file")—Cursor sẽ tạo/chỉnh sửa files dựa trên yêu cầu của bạn.
   - Cho Chat: Mở Chat sidebar (icon hoặc Ctrl+Shift+L) cho questions hoặc refinements.
5. **Mẹo:** Cursor sử dụng models như GPT-4 hoặc Claude—cấu hình trong Settings nếu cần. Sử dụng Composer cho code scaffolding, Chat cho brainstorming.
6. **Prompt cho Trợ giúp:**
   - Hỏi Cursor Chat: "How do I set up a new project folder in Cursor and use Composer for code generation?"

## Nhiệm vụ & Hướng dẫn
Làm theo các bước này để brainstorm với Grok 4, tạo hình ảnh/text, xây dựng và lặp lại website memecoin trong Cursor, và cải thiện site của bạn bằng Cursor AI. Tập trung vào Grok 4 cho research/prompts và Cursor cho scaffolding; sử dụng ChatGPT nhẹ cho images nếu Grok 4's image gen bị hạn chế. Các bước liên quan Git (Publishing) là riêng biệt và được xử lý với Cursor prompts.

### Nhiệm vụ 1: Giới thiệu Recursive Prompting
**Mục tiêu:** Học recursive prompting—một kỹ thuật nơi bạn sử dụng AI để tạo hoặc cải thiện prompt, sau đó sử dụng prompt được cải thiện đó để tạo thứ khác (ví dụ: hình ảnh hoặc code). Điều này xây dựng kết quả tốt hơn một cách lặp lại và dạy AI chaining.

1. **Recursive Prompting là gì?**
   - Giống như yêu cầu AI giúp bạn đặt câu hỏi tốt hơn. Ví dụ, bắt đầu với ý tưởng cơ bản ("a rocket logo"), sử dụng AI để tạo prompt chi tiết ("cartoon rocket with smiling face, blue/yellow, high-res"), sau đó sử dụng prompt đó trong công cụ AI khác để tạo logo.
   - Tại sao? AI-refined prompts dẫn đến output chính xác hơn, sáng tạo hơn. Đây là chìa khóa trong AI engineering để tối ưu hóa kết quả mà không cần điều chỉnh thủ công.
2. **Thực hành với Cursor hoặc Grok 4:**
   - Mở Cursor Chat hoặc Grok 4 và prompt: "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
   - AI có thể output: "Generate a vibrant, cartoon-style logo for 'GrokCoin' featuring a rocket ship with a cute smiling face blasting through space, surrounded by stars and planets, in bright blue and yellow tones, high resolution, square format, transparent background."
   - Copy prompt được cải thiện này và sử dụng trong Nhiệm vụ 3 cho image generation.
3. **Áp dụng cho Website Code (Optional Preview):**
   - Prompt Cursor: "Create a refined prompt for generating a Next.js homepage for a memecoin site."
   - Sử dụng output sau này trong bootcamp—hôm nay, tập trung vào brainstorming và images.
4. **Mẹo:** Recursive prompting tiết kiệm thời gian; chain 2-3 iterations cho kết quả tốt nhất (ví dụ: generate prompt > refine with feedback > final use).

### Nhiệm vụ 2: Brainstorm Ý tưởng Memecoin Sử dụng Grok 4 với Recursive Prompting
**Mục tiêu:** Sử dụng Grok 4 cho initial research và brainstorm 10 ý tưởng memecoin viral dựa trên ý tưởng cá nhân bạn chỉ định (ví dụ: "a memecoin about my Shiba Inu dog named Kylie"). Tập trung vào virality bằng cách xây dựng narrative mạnh mẽ xung quanh community, memes, và trends. Sử dụng recursive prompting để refine và chọn concept (token name, symbol, narrative), kết quả là prompt để paste vào Cursor. Hiểu "meta" vs. các concept khác.

1. **Hiểu "Meta" vs. Các Concept Memecoin Khác:**
   - **Meta Memecoins:** Những coin này phản ánh những gì đang viral hoặc popular ngay bây giờ, khai thác trending topics trên X, TikTok, politics, hoặc crypto culture (ví dụ: coins về memecoins, current trends, hoặc satire như "CoinAboutCoins"). Chúng viral thông qua humor, timely references (ví dụ: 2025 election memes), và platform-specific in-jokes, lan truyền nhanh trên social media. Ví dụ: PEPE (frog meme meta) leveraged cultural trends.
   - **Animal Concepts (ví dụ: Dogs, Animals):** Những coin này dựa vào themes dễ thương/có liên quan (ví dụ: Dogecoin's Shiba Inu dog cho fun/loyalty). Chúng lan truyền viral qua emotional appeal, community airdrops, và endorsements (ví dụ: Elon Musk cho DOGE). Trong 2025, animal coins như Dogwifhat (WIF) thành công với shareable mascots nhưng đối mặt với saturation—meta coins nổi bật bằng cách align với current hype.
   - **Virality Tips:** Nhắm đến concepts với strong narratives (story + emotion), meme potential (remixable content), và community hooks (airdrops, contests). Meta concepts thrive trên trends (ví dụ: X hashtags #SolanaSzn); animal ones cần fresh spins để tránh fatigue.
2. **Truy cập Grok 4:**
   - Vào [grok.com](https://grok.com/) hoặc X app, đăng nhập (Premium+ hoặc SuperGrok required cho Grok 4).
3. **Initial Research với Grok 4:**
   - Prompt Grok 4: "Research successful viral memecoin concepts from 2025 (as of 02:45 PM CDT, August 02, 2025). What makes them viral? Provide 5 examples with token name, symbol, narrative, and key success factors (e.g., community, memes). Compare 'meta' (trending topics) concepts vs. animal-themed ones like dogs."
   - Sử dụng insights để inform brainstorming của bạn (ví dụ: meta coins như PEPE thrive trên trends; dog coins như DOGE trên endorsements).
4. **Bắt đầu với Ý tưởng của bạn:**
   - Quyết định về personal theme (ví dụ: "memecoin about my Shiba Inu dog named Kylie" hoặc "memecoin about AI engineers").
   - Sử dụng recursive prompting trong Grok 4: "Generate a refined prompt for brainstorming 10 viral memecoin ideas based on: [your idea]. Emphasize virality through strong narratives, meme potential, community engagement, and current trends on X or TikTok. Include token name, symbol, and narrative for each, highlighting if it's 'meta' or animal-themed. Format the output as a single prompt to paste into Cursor for website generation."
   - Ví dụ refined output: "Brainstorm 10 creative, viral memecoin concepts based on a Shiba Inu dog named Kylie. For each, provide a catchy token name, 3-letter symbol, and a short narrative (50-100 words) that builds hype with meme virality, community angle, and trending elements from X/TikTok. Note if it's 'meta' (trending topics) or animal-themed. Output as a single prompt to paste into Cursor for generating a website: 'Generate a single static HTML page (index.html) for a memecoin called [token name] with all HTML, CSS (in <style> tags), and JavaScript (in <script> tags). Include a bold hero section with coin name [token name], tagline [narrative summary], and mascot logo image, a vibrant tokenomics table, an interactive roadmap, a clear how-to-buy guide, community links, a buy button, and a responsive meme gallery, using a color palette inspired by [theme colors]. Use semantic HTML, responsive design, and a fun aesthetic inspired by top Solana memecoins.'"
5. **Brainstorm với Grok 4:**
   - Paste refined prompt vào Grok 4.
   - Grok sẽ output 10 ideas, ví dụ:
     - Idea 1 (Animal-Themed): Token Name: KylieShib, Symbol: KYL, Narrative: "KylieShib is the ultimate doggo coin for Shiba lovers! Inspired by your loyal Kylie, this memecoin celebrates fluffy adventures and airdrops tied to #DogTok trends. Join for meme contests—viral with cute pup videos!"
     - Idea 2 (Meta): Token Name: KylieMeta, Symbol: KMT, Narrative: "KylieMeta mocks 2025's crypto hype! Kylie the Shiba 'meta-dog' roasts TikTok pump-and-dumps with irony. Narrative: A coin trending with #SolanaSzn—viral via X satire!"
   - Review ideas, so sánh meta (trending, sustainable hype) vs. animal (cute, quick virality nhưng risk of fad).
6. **Refine Selection Recursively:**
   - Nếu cần, prompt Grok 4: "Refine my top 3 memecoin ideas from the list to maximize virality: Strengthen narratives with current X/TikTok trends, meme templates, and LetsBonk integration. Explain why a meta concept might outperform animal ones in 2025."
   - Finalize một viral concept (token name, symbol, narrative) với strong narrative (ví dụ: story + memes + trends)—update tất cả subsequent tasks với nó.
7. **Prompt cho Trợ giúp:**
   - Hỏi Cursor Chat: "Help me select the most viral memecoin concept from Grok 4's brainstorm list, focusing on narrative strength and meta vs. animal tradeoffs."

### Nhiệm vụ 3: Tạo X Banner, DEX Banner, và Logo Sử dụng AI (Grok 4 và ChatGPT)
**Mục tiêu:** Tạo X banner, một DEX banner duy nhất cho cả DexScreener và DexTools, và logo tập trung vào mascot cho website memecoin của bạn sử dụng Grok 4 và ChatGPT. Sử dụng recursive prompting trong Grok 4 để refine prompts và lưu images locally cho đến Publishing. Lưu ý rằng images có thể cần chỉnh sửa trong Photoshop hoặc alternative miễn phí.

1. **Chọn AI Tools:**
   - **Grok 4:** Sử dụng [grok.com](https://grok.com/) hoặc X app cho initial prompt refinement và image gen (via Aurora hoặc similar trong Grok 4).
   - **ChatGPT (DALL-E):** Sử dụng [chat.openai.com](https://chat.openai.com/) cho final image generation nếu Grok 4's output bị hạn chế (Plus subscription needed).
2. **Refine Prompts với Recursive Prompting trong Grok 4:**
   - Prompt Grok 4: "Generate a refined prompt for a mascot-focused logo based on [your narrative]. Example: Cute Shiba dog with accessories."
   - Ví dụ refined output: "Generate a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in bright red and white colors. High resolution, square format (e.g., 500x500 pixels), transparent background, PNG format."
3. **Generate Logo:**
   - Paste refined prompt vào Grok 4 cho initial gen. Nếu không satisfactory, refine trong ChatGPT với: "Create a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in red and white, 500x500 pixels, transparent PNG."
   - Download như `logo.png`.
4. **Generate X Banner:**
   - Refined Prompt (sử dụng Grok 4 để improve): "Create a banner image for an X (Twitter) profile for '[your token name]'. Feature the mascot, tagline based on [your narrative], and elements like [theme, e.g., dogs in space]. High resolution, 1500x500 pixels, PNG format."
   - Sử dụng Grok 4, sau đó refine trong ChatGPT nếu cần: "Design an X banner for 'KylieShib' with a Shiba dog mascot, 'Loyal to the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - Download như `x-banner.png`.
5. **Generate DEX Banner (cho DexScreener và DexTools):**
   - Refined Prompt: "Create a banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. High resolution, 1500x500 pixels, PNG format."
   - Sử dụng Grok 4, sau đó refine trong ChatGPT nếu cần: "Create a DEX banner for 'KylieShib' with a Shiba dog mascot, 'To the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - Download như `dex-banner.png`.
6. **Image Editing với Photoshop hoặc Free Alternative:**
   - **Tại sao Edit?** AI-generated images có thể cần cropping (ví dụ: remove unwanted backgrounds), resizing (ví dụ: exact 500x500 cho logo), hoặc adding typography (ví dụ: token name/symbol). Photoshop offers advanced tools; GIMP là free option.
   - **Steps:**
     - Mở mỗi image (ví dụ: `logo.png`) trong Photoshop hoặc GIMP.
     - **Crop Background:** Sử dụng "Magic Wand" hoặc "Lasso" tool để select và remove unwanted areas, refine edges.
     - **Resize:** Vào "Image > Image Size," set logo to 500x500 pixels, banners to 1500x500 pixels.
     - **Add Typography:** Sử dụng "Text" tool để add "[your token name]" hoặc tagline nếu missing, matching theme (ví dụ: bold red font).
     - **Save:** Export như PNG với transparent background (File > Export As > PNG).
   - **Mẹo:** Nếu mới với editing, xem tutorial nhanh (ví dụ: YouTube search "GIMP basics") hoặc hỏi Cursor Chat: "Guide me to crop and resize an image in Photoshop/GIMP."
7. **Store Images Locally:**
   - Tạo folder `assets` trong directory `memecoin-site-day1` của bạn.
   - Di chuyển edited `logo.png`, `x-banner.png`, và `dex-banner.png` vào `assets`.
   - **Lưu ý:** Images sẽ được deploy lên GitHub Pages trong Publishing step—giữ local cho bây giờ.
8. **Prompt cho Trợ giúp:**
   - Nếu tool không hoạt động, hỏi Cursor Chat: "How to generate images with Grok 4 and ChatGPT? Provide sample prompts for a memecoin mascot logo, X banner, and DEX banner."

### Nhiệm vụ 4: Scaffold Website Memecoin với Inspiration từ Top Solana Memecoins
**Mục tiêu:** Tạo một file `index.html` duy nhất chứa tất cả HTML, CSS (trong `<style>`), và JavaScript (trong `<script>`) cho website memecoin, kết hợp AI-generated image URLs của bạn. Sử dụng recursive prompting trong Cursor để refine code prompt với inspiration từ top Solana memecoin websites, leveraging colors từ images.

1. **Research Inspiration với Grok 4:**
   - Prompt Grok 4: "Suggest 5 top-performing memecoin websites on Solana from 2025 (as of 02:45 PM CDT, August 02, 2025). Provide their URLs, key design features (e.g., bold hero, meme galleries), and why they work for viral marketing."
   - Ví dụ output: "1. bonk.in - Bold hero with mascot, meme gallery, vibrant colors. 2. wifcoin.sol - Animated roadmap, community section, neon palette. 3. pepe.lol - Satirical design, tokenomics table, dark theme. 4. shibarmy.com - Dog-themed layout, how-to-buy guide, playful fonts. 5. metadog.io - Meta-narrative focus, interactive elements, sleek design."
   - Note những insights này cho design của bạn.
2. **Refine Prompt với Recursive Prompting trong Cursor:**
   - Mở Cursor Chat và prompt: "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links (X, TG, DexScreener placeholders), a buy button (placeholder for Raydium), and responsive meme gallery, inspired by top Solana memecoin designs (e.g., bonk.in, wifcoin.sol). Use a color palette from [describe images, e.g., red and white for Shiba theme]."
   - Cursor sẽ output refined prompt, ví dụ: "Use primary color #FF0000 for backgrounds, secondary #FFFFFF for accents."
3. **Mở Cursor Composer:**
   - Mở Composer (Ctrl+Shift+I hoặc Cmd+Shift+I).
4. **Paste Refined Prompt vào Cursor Composer:**
   - Paste refined prompt từ Cursor Chat (replace với local image paths, ví dụ: `assets/logo.png`, và selected concept của bạn; update to GitHub URLs trong Publishing):
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
   - Cursor sẽ generate `index.html` trong folder `memecoin-site-day1` của bạn với embedded `<style>` và `<script>` sections, sử dụng colors từ images và inspired designs. Save nó.
5. **Review Code:**
   - Mở `index.html` trong Cursor. Verify sections như `<section id="hero">`, `<table id="tokenomics">`, etc., có present, và logo, social links, và buy button load via local paths (update to GitHub URLs trong Publishing).
   - Check `<style>` cho responsiveness, color usage (ví dụ: `background: #FF0000;`), và Solana-inspired elements (ví dụ: vibrant layout).
   - Check `<script>` cho basic interactivity (ví dụ: console logs hoặc event listeners).
6. **Test Locally:**
   - Mở `index.html` trong browser (double-click hoặc run `open index.html` trong terminal).
   - Ensure tất cả sections display correctly, logo loads, colors match images, và mobile-responsive (resize browser). Nếu issues arise, hỏi Cursor Chat: "Fix my HTML/CSS layout in index.html or image loading errors."

### Nhiệm vụ 5: Lặp lại trên Website
**Mục tiêu:** Enhance single-page site với AI-generated improvements cho interactivity, design, và additional inspiration từ top Solana memecoins. Iteration involves either regenerating với new direction hoặc making small improvements như subtle animations, button styling, hoặc typography changes, tất cả through prompt engineering.

1. **Guidance on Iteration:**
   - **Regenerate với New Direction:** Nếu initial design cảm thấy off, prompt Cursor để start fresh với new style (ví dụ: "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design").
   - **Make Small Improvements:** Refine incrementally với prompts cho subtle enhancements:
     - Add subtle animation effects (ví dụ: "Add a fade-in animation to the hero section").
     - Improve button styling (ví dụ: "Enhance the buy button with a gradient background and rounded corners").
     - Change typography (ví dụ: "Update all headings to use a bold, playful font inspired by shibarmy.com").
   - Sử dụng Composer cho targeted prompts để tránh overwriting whole file (ví dụ: "Update only the <style> tag...").
   - Test sau mỗi change để ensure functionality và aesthetics align với vision của bạn.
2. **Add Interactivity:**
   - Prompt Cursor trong Composer: "Add JavaScript in my index.html <script> tag to show an alert when clicking community links (e.g., 'Join our community!')."
3. **Enhance Design:**
   - Prompt Cursor trong Composer: "Enhance my index.html <style> tag with a subtle fade-in animation for the hero section, inspired by wifcoin.sol."
4. **Improve Buy Button:**
   - Prompt Cursor trong Composer: "Improve the buy button in my index.html hero section with a gradient background and rounded corners, ensuring mobile-friendliness."
5. **Adjust Typography:**
   - Prompt Cursor trong Composer: "Change all headings in my index.html to use a bold, playful font inspired by shibarmy.com."
6. **Save Locally:**
   - Save changes to `index.html`.
7. **Verify Updates:**
   - Reopen `index.html` trong browser để see changes.
8. **Prompt cho Trợ giúp:**
   - Nếu cần, hỏi Cursor Chat: "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

### Nhiệm vụ 6: Hiểu Website Memecoin & AI
**Mục tiêu:** Học purpose của memecoin site elements và cách AI simplifies development.

1. **Prompt Cursor cho Explanations:**
   - Hỏi: "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
   - Expected response:
     - Hero: Captures attention với bold branding.
     - Tokenomics: Builds trust với transparent supply/distribution.
     - Roadmap: Shows future plans để excite investors.
     - How-to-buy: Simplifies onboarding cho new users.
     - Community: Drives engagement via social platforms.
     - Meme gallery: Uses humor cho virality.
2. **AI in Web3 Quiz:**
   - Prompt Cursor: "Create a 3-question quiz about how AI helps build websites, generate images, and manage socials, with answers. Example: How does Grok 4 or Cursor make image creation easier?"
   - Ví dụ response:
     - Q: How does AI like Grok 4/Cursor help with images? A: Generates logos, banners, and memes from text prompts.
     - Q: What's an AI prompt for socials? A: A request like "Write a tweet for a memecoin launch."
     - Q: How is AI changing web dev? A: Speeds up coding, asset creation, and social automation.
3. **Reflect:** Trong Cursor, tạo `notes.txt` và write: "How did AI help me with brainstorming, images, and site today?" (ví dụ: "Grok 4 brainstormed ideas, Cursor scaffolded the site!"). Save locally.

### Nhiệm vụ 7: Publishing lên GitHub Pages
**Mục tiêu:** Deploy website và images của bạn lên GitHub Pages sử dụng Cursor để generate SSH keys và thiết lập GitHub authentication (không cần manual commands).

1. **Generate SSH Keys với Cursor:**
   - Mở Cursor Chat và prompt: "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
   - Follow Cursor's instructions (ví dụ: nó có thể guide bạn đến terminal within Cursor, generate keys như `id_rsa` và `id_rsa.pub`, và prompt bạn copy public key to GitHub under Settings > SSH and GPG keys > New SSH key).
2. **Set Up GitHub Authentication với Cursor:**
   - Prompt Cursor: "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
   - Follow Cursor's guidance (ví dụ: nó có thể suggest creating a repo named `memecoin-site-day1`, linking it, và pushing với prompt như "Push my local memecoin-site-day1 folder to GitHub").
3. **Deploy to GitHub Pages:**
   - Prompt Cursor: "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
   - Cursor sẽ guide bạn đến GitHub Settings > Pages, set source to `main` branch, `/ (root)` folder, và verify deployment tại `https://yourusername.github.io/memecoin-site-day1`.
4. **Update Image URLs:**
   - Sau deployment, prompt Cursor: "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
   - Save và test updated `index.html` locally.
5. **Prompt cho Trợ giúp:**
   - Nếu issues arise, hỏi Cursor Chat: "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## Cursor Prompts cho Day 1
Xem `docs/daily_prompts.md` trong course repo cho full list.

- **Recursive Prompting:**
  - "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
  - "Refine this prompt for generating a single-page HTML memecoin website: Basic hero and tokenomics sections."
  - "Refine this prompt for an X banner: Space-themed banner for [your token name]."
  - "Suggest 5 top-performing memecoin websites on Solana from 2025. Provide their URLs, key design features, and why they work for viral marketing."
  - "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links, a buy button, and responsive meme gallery, inspired by top Solana memecoin designs."

- **Image Generation (Grok 4/ChatGPT):**
  - "Generate a fun, vibrant mascot-focused logo for a memecoin called '[your token name]'. [Description from narrative, e.g., cute Shiba dog with laser eyes]. High resolution, 500x500 pixels, transparent background, PNG format."
  - "Create a banner image for an X profile for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Create a single banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Generate a small square image (400x400 pixels) for a tweet about '[your token name]' showing the mascot with a 'LFG LetsBonk!' text overlay, matching [your narrative]. PNG format."

- **Scaffold:**
  - "Generate a single static HTML page (index.html) for a memecoin called '[your token name]' with all HTML, CSS (in <style>), and JavaScript (in <script>). Include a bold hero section (coin name, tagline, logo URL, and a placeholder buy button), vibrant tokenomics table (1B supply, 50% community, 30% dev, 20% marketing), interactive roadmap timeline, clear how-to-buy guide, community links, and responsive meme gallery (4 placeholder URLs). Use semantic HTML, responsive design, and a fun aesthetic."
  - "Add semantic HTML to my index.html for a memecoin site with clear section IDs."
  - "Embed CSS in my index.html <style> tag for a mobile-responsive design inspired by top Solana memecoins."

- **Iterate:**
  - "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design."
  - "Add a subtle fade-in animation to the hero section of my index.html."
  - "Enhance the buy button in my index.html with a gradient background and rounded corners."
  - "Update all headings in my index.html to use a bold, playful font inspired by shibarmy.com."
  - "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

- **Understand:**
  - "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
  - "What is a memecoin? Explain tokenomics and roadmaps in simple terms."
  - "How does Cursor AI speed up web development? Give 3 examples."
  - "How can AI like Grok 4 or Cursor generate images and tweets for memecoin projects?"

- **Publishing:**
  - "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
  - "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
  - "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
  - "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
  - "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## Learning Outcomes
- Brainstormed viral memecoin ideas sử dụng Grok 4 với recursive prompting, selected concept với strong narrative, và sử dụng Grok 4 cho initial research/prompt creation, kết quả là prompt cho Cursor.
- Generated X banner, DEX banner, và mascot-focused logo sử dụng Grok 4 và ChatGPT, với recursive prompting cho refinement, edited trong Photoshop/GIMP, và stored locally.
- Built và iterated trên single-page memecoin website (`index.html`) với AI-generated assets sử dụng Cursor AI, pasting refined prompts từ Grok 4, inspired by top Solana memecoin designs, including social links và buy button.
- Sử dụng Cursor's Composer và Chat để generate code và troubleshoot issues.
- Learned recursive prompting cho better AI outputs.
- (Publishing Step) Learned cách sử dụng Cursor để generate SSH keys và set up GitHub authentication cho deployment.

## Next Steps
- Save work của bạn locally trong folder `memecoin-site-day1`.
- Verify local site của bạn bằng cách mở `index.html` trong browser.
- Tomorrow (Day 2): Dive into Building Your Memecoin Community with AI, potentially setting up Telegram và X để expand reach của project. 