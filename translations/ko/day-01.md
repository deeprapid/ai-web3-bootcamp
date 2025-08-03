# 1일차: AI를 사용하여 메메코인 웹사이트 구축 및 배포

## 목표
- Grok 4를 사용하여 초기 연구, 프롬프트 생성 및 재귀 프롬프팅을 통한 바이럴 메메코인 아이디어 브레인스토밍을 수행하고, 강력한 내러티브 구축에 집중하여 Cursor에 붙여넣을 프롬프트를 생성합니다.
- Grok 4 또는 ChatGPT를 가볍게 사용하여 메메코인 웹사이트용 X 배너, DexScreener와 DexTools 모두를 위한 단일 DEX 배너, 마스코트 중심 로고를 생성합니다.
- Cursor AI를 사용하여 메메코인 웹사이트용 단일 정적 HTML 페이지(`index.html`)를 생성하고 반복하며, 모든 HTML, CSS(`<style>` 내), JavaScript(`<script>` 내)를 포함하고, 주요 요소: 히어로 섹션, 토큰노믹스, 로드맵, 구매 방법 가이드, 커뮤니티 링크(X, TG, DexScreener용), 구매 버튼(Raydium용 플레이스홀더), 밈 갤러리를 포함하며, 최고의 Solana 메메코인 웹사이트에서 영감을 받습니다.
- 사이트와 이미지를 GitHub Pages에 배포하여 실시간 공개 URL을 얻고, 모든 푸시에서 자동 업데이트(별도 게시 단계에서 다룸).
- 메메코인 웹사이트 구성 요소와 AI가 웹 개발을 어떻게 가속화하는지 이해합니다.
- 재귀 프롬프팅 학습: AI를 사용하여 프롬프트를 생성/개선한 다음 해당 개선된 프롬프트를 사용하여 이미지나 코드를 생성합니다.
- (게시 단계) Cursor를 사용하여 SSH 키를 생성하고 배포를 위한 GitHub 인증을 설정하는 방법을 학습합니다(수동 명령 불필요).

## 사전 요구사항
- **도구:** [Cursor](https://cursor.com/) 설치, 선택적으로 [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) 또는 무료 대안(예: GIMP)을 이미지 편집용으로 설치. (Node.js와 Git은 게시 단계까지 선택사항)
- **계정:** [GitHub](https://github.com/) 계정 생성, [Grok 4](https://grok.com/) (이미지 생성과 같은 고급 기능을 위한 Premium+ 또는 SuperGrok 구독), 선택적 [ChatGPT](https://chat.openai.com/) (DALL-E용, 가볍게 사용)
- **지식:** 기본 HTML(예: `<div>` 태그), CSS(예: 색상 스타일링), JavaScript(예: 간단한 함수)
- **참고:** 오늘은 도메인 구매와 같은 비용을 피합니다. 무료 GitHub Pages URL(`yourusername.github.io/memecoin-site`)을 사용하세요. Grok 4로 이미지 생성에는 구독이 필요합니다; 백업으로 ChatGPT를 가볍게 사용하세요. Photoshop은 구독이 필요합니다(~$20/월) 또는 GIMP 같은 무료 도구를 사용하세요. 토큰은 나중에 LetsBonk.fun(Solana 메메코인 런칭패드)에서 런칭됩니다—오늘의 초점은 웹사이트입니다.

## 설정: 프로젝트를 위한 Cursor 구성
**목표:** Cursor를 주요 AI 코딩 도구로 설정하고, 로컬 폴더를 생성하고, 워크스페이스에 추가하고, 생성을 위한 프롬프트 박스를 사용합니다.

1. **Cursor 설치 및 열기:**
   - [cursor.com](https://cursor.com/)에서 Cursor를 다운로드하고 설치하세요
   - Cursor 열기—VS Code처럼 보이지만 Composer(코드 생성용)와 Chat(대화용) 같은 AI 기능이 있습니다

2. **로컬 폴더 생성:**
   - 파일 탐색기에서 폴더 생성: `mkdir memecoin-site-day1`
   - Cursor에서 열기: File > Open Folder > `memecoin-site-day1` 선택

3. **워크스페이스에 추가:**
   - Cursor에서 View > Command Palette(Ctrl+Shift+P 또는 Cmd+Shift+P)로 이동, "Workspaces: Add Folder to Workspace" 검색하고 `memecoin-site-day1` 폴더 선택
   - 이렇게 하면 Cursor가 AI 작업을 위해 폴더에 접근할 수 있습니다(예: 그 안에 파일 생성)

4. **프롬프트 박스(Composer) 사용:**
   - Ctrl+Shift+I(또는 Mac에서 Cmd+Shift+I)로 Composer 열기
   - 자연어 프롬프트 입력(예: "Generate a hello world HTML file")—Cursor가 요청에 따라 파일을 생성/편집합니다
   - Chat용: Chat 사이드바(아이콘 또는 Ctrl+Shift+L)를 열어 질문이나 개선사항을 처리합니다

5. **팁:** Cursor는 GPT-4나 Claude 같은 모델을 사용합니다—필요시 설정에서 구성하세요. Composer는 코드 스캐폴딩용, Chat은 브레인스토밍용으로 사용하세요

6. **도움을 위한 프롬프트:**
   - Cursor Chat에 물어보세요: "How do I set up a new project folder in Cursor and use Composer for code generation?"

## 작업 및 지침
이 단계들을 따라 Grok 4로 브레인스토밍하고, 이미지/텍스트를 생성하고, Cursor에서 메메코인 웹사이트를 구축하고 반복하며, Cursor AI로 사이트를 개선하세요. Grok 4를 연구/프롬프트용으로, Cursor를 스캐폴딩용으로 집중하세요; Grok 4의 이미지 생성이 제한적이면 ChatGPT를 가볍게 사용하세요. Git 관련 단계(게시)는 별도이며 Cursor 프롬프트로 처리됩니다.

### 작업 1: 재귀 프롬프팅 소개
**목표:** 재귀 프롬프팅을 학습합니다—AI를 사용하여 프롬프트를 생성하거나 개선한 다음, 해당 개선된 프롬프트를 사용하여 다른 것을 생성하는 기술(예: 이미지나 코드). 이는 반복적으로 더 나은 결과를 구축하고 AI 체이닝을 가르칩니다.

1. **재귀 프롬프팅이란?**
   - AI가 더 나은 질문을 하는 데 도움을 주도록 요청하는 것과 같습니다. 예를 들어, 기본 아이디어("a rocket logo")로 시작하여 AI를 사용해 상세한 프롬프트("cartoon rocket with smiling face, blue/yellow, high-res")를 만들고, 그 프롬프트를 다른 AI 도구에서 로고를 생성하는 데 사용합니다
   - 왜? AI로 개선된 프롬프트는 더 정확하고 창의적인 출력을 만듭니다. 수동 조정 없이 결과를 최적화하는 AI 엔지니어링의 핵심입니다

2. **Cursor나 Grok 4로 연습:**
   - Cursor Chat이나 Grok 4를 열고 프롬프트: "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
   - AI가 출력할 수 있는 것: "Generate a vibrant, cartoon-style logo for 'GrokCoin' featuring a rocket ship with a cute smiling face blasting through space, surrounded by stars and planets, in bright blue and yellow tones, high resolution, square format, transparent background."
   - 이 개선된 프롬프트를 복사하고 작업 3에서 이미지 생성에 사용하세요

3. **웹사이트 코드에 적용(선택적 미리보기):**
   - Cursor에 프롬프트: "Create a refined prompt for generating a Next.js homepage for a memecoin site."
   - 부트캠프의 나중 부분에서 출력을 사용하세요—오늘은 브레인스토밍과 이미지에 집중하세요

4. **팁:** 재귀 프롬프팅은 시간을 절약합니다; 최고의 결과를 위해 2-3번의 반복을 체이닝하세요(예: 프롬프트 생성 > 피드백으로 개선 > 최종 사용)

### 작업 2: Grok 4와 재귀 프롬프팅을 사용하여 메메코인 아이디어 브레인스토밍
**목표:** Grok 4를 사용하여 초기 연구와 10개의 바이럴 메메코인 아이디어 브레인스토밍을 수행하고, 지정한 개인 아이디어를 기반으로 합니다(예: "내 시바견 Kylie에 대한 메메코인"). 커뮤니티, 밈, 트렌드를 중심으로 강력한 내러티브를 구축하여 바이럴성에 집중합니다. 재귀 프롬프팅을 사용하여 개념(토큰 이름, 심볼, 내러티브)을 개선하고 선택하고, Cursor에 붙여넣을 프롬프트를 생성합니다. "메타"와 다른 개념을 이해합니다.

1. **"메타"와 다른 메메코인 개념 이해:**
   - **메타 메메코인:** 현재 바이럴하거나 인기 있는 것을 반영하며, X, TikTok, 정치, 또는 암호화 문화의 트렌딩 주제를 다룹니다(예: 메메코인에 대한 코인, 현재 트렌드, 또는 "CoinAboutCoins" 같은 풍자). 그들은 유머, 시의적절한 참조(예: 2025년 선거 밈), 플랫폼별 내부 농담을 통해 바이럴하게 퍼지며, 소셜 미디어에서 빠르게 확산됩니다. 예시: PEPE(개구리 밈 메타)는 문화적 트렌드를 활용했습니다
   - **동물 개념(예: 개, 동물):** 귀엽고/관련성 있는 테마에 의존합니다(예: Dogecoin의 시바견 개는 재미/충성도용). 그들은 감정적 매력, 커뮤니티 에어드롭, 그리고 지지(예: Elon Musk의 DOGE)를 통해 바이럴하게 확산됩니다. 2025년에 Dogwifhat(WIF) 같은 동물 코인은 공유 가능한 마스코트로 성공하지만 포화에 직면합니다—메타 코인은 현재 힙과 일치하여 돋보입니다
   - **바이럴성 팁:** 강력한 내러티브(스토리 + 감정), 밈 잠재력(재혼합 가능한 콘텐츠), 커뮤니티 훅(에어드롭, 콘테스트)을 가진 개념을 목표로 하세요. 메타 개념은 트렌드에서 번성합니다(예: X 해시태그 #SolanaSzn); 동물은 피로를 피하기 위해 신선한 스핀이 필요합니다

2. **Grok 4 접근:**
   - [grok.com](https://grok.com/) 또는 X 앱으로 이동, 로그인(고급 기능을 위해 Premium+ 또는 SuperGrok 필요)

3. **Grok 4로 초기 연구:**
   - Grok 4에 프롬프트: "Research successful viral memecoin concepts from 2025 (as of 02:45 PM CDT, August 02, 2025). What makes them viral? Provide 5 examples with token name, symbol, narrative, and key success factors (e.g., community, memes). Compare 'meta' (trending topics) concepts vs. animal-themed ones like dogs."
   - 브레인스토밍을 안내하기 위해 인사이트를 사용하세요(예: PEPE 같은 메타 코인은 트렌드에서 번성; DOGE 같은 개 코인은 지지에서)

4. **당신의 아이디어로 시작:**
   - 개인 테마 결정(예: "내 시바견 Kylie에 대한 메메코인" 또는 "AI 엔지니어에 대한 메메코인")
   - Grok 4에서 재귀 프롬프팅 사용: "Generate a refined prompt for brainstorming 10 viral memecoin ideas based on: [your idea]. Emphasize virality through strong narratives, meme potential, community engagement, and current trends on X or TikTok. Include token name, symbol, and narrative for each, highlighting if it's 'meta' or animal-themed. Format the output as a single prompt to paste into Cursor for website generation."

5. **Grok 4로 브레인스토밍:**
   - 개선된 프롬프트를 Grok 4에 붙여넣기
   - Grok이 10개의 아이디어를 출력할 것입니다, 예:
     - 아이디어 1(동물 테마): 토큰 이름: KylieShib, 심볼: KYL, 내러티브: "KylieShib는 시바 애호가를 위한 궁극의 도그고 코인입니다! 당신의 충성스러운 Kylie에서 영감을 받아, 이 메메코인은 #DogTok 트렌드와 연결된 털복숭이 모험과 에어드롭을 축하합니다. 밈 콘테스트에 참여하세요—귀여운 강아지 비디오로 바이럴!"
     - 아이디어 2(메타): 토큰 이름: KylieMeta, 심볼: KMT, 내러티브: "KylieMeta는 2025년의 암호화 힙을 조롱합니다! 시바견 Kylie '메타-개'가 아이러니로 TikTok 펌프앤덤프를 조롱합니다. 내러티브: #SolanaSzn과 함께 트렌딩하는 코인—X 풍자를 통해 바이럴!"

6. **재귀적으로 선택 개선:**
   - 필요시 Grok 4에 프롬프트: "Refine my top 3 memecoin ideas from the list to maximize virality: Strengthen narratives with current X/TikTok trends, meme templates, and LetsBonk integration. Explain why a meta concept might outperform animal ones in 2025."
   - 강력한 내러티브(예: 스토리 + 밈 + 트렌드)를 가진 바이럴 개념(토큰 이름, 심볼, 내러티브)을 최종 결정하고—모든 후속 작업을 그것으로 업데이트하세요

7. **도움을 위한 프롬프트:**
   - Cursor Chat에 물어보세요: "Help me select the most viral memecoin concept from Grok 4's brainstorm list, focusing on narrative strength and meta vs. animal tradeoffs."

### 작업 3: AI를 사용하여 X 배너, DEX 배너, 로고 생성(Grok 4와 ChatGPT)
**목표:** Grok 4와 ChatGPT를 사용하여 메메코인 웹사이트용 X 배너, DexScreener와 DexTools 모두를 위한 단일 DEX 배너, 마스코트 중심 로고를 생성합니다. Grok 4에서 재귀 프롬프팅을 사용하여 프롬프트를 개선하고 게시까지 로컬에 이미지를 저장합니다. 이미지는 Photoshop이나 무료 대안에서 편집이 필요할 수 있습니다.

1. **AI 도구 선택:**
   - **Grok 4:** 초기 프롬프트 개선과 이미지 생성을 위해 [grok.com](https://grok.com/) 또는 X 앱 사용(Grok 4의 Aurora 또는 유사한 기능을 통해)
   - **ChatGPT(DALL-E):** Grok 4의 출력이 제한적이면 최종 이미지 생성을 위해 [chat.openai.com](https://chat.openai.com/) 사용(Plus 구독 필요)

2. **Grok 4에서 재귀 프롬프팅으로 프롬프트 개선:**
   - Grok 4에 프롬프트: "Generate a refined prompt for a mascot-focused logo based on [your narrative]. Example: Cute Shiba dog with accessories."
   - 개선된 출력 예시: "Generate a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in bright red and white colors. High resolution, square format (e.g., 500x500 pixels), transparent background, PNG format."

3. **로고 생성:**
   - 개선된 프롬프트를 Grok 4에 붙여넣어 초기 생성. 만족스럽지 않으면 ChatGPT에서 개선: "Create a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in red and white, 500x500 pixels, transparent PNG."
   - `logo.png`로 다운로드

4. **X 배너 생성:**
   - 개선된 프롬프트(개선을 위해 Grok 4 사용): "Create a banner image for an X (Twitter) profile for '[your token name]'. Feature the mascot, tagline based on [your narrative], and elements like [theme, e.g., dogs in space]. High resolution, 1500x500 pixels, PNG format."
   - Grok 4 사용, 필요시 ChatGPT에서 개선: "Design an X banner for 'KylieShib' with a Shiba dog mascot, 'Loyal to the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - `x-banner.png`로 다운로드

5. **DEX 배너 생성(DexScreener와 DexTools용):**
   - 개선된 프롬프트: "Create a banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. High resolution, 1500x500 pixels, PNG format."
   - Grok 4 사용, 필요시 ChatGPT에서 개선: "Create a DEX banner for 'KylieShib' with a Shiba dog mascot, 'To the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - `dex-banner.png`로 다운로드

6. **Photoshop이나 무료 대안으로 이미지 편집:**
   - **왜 편집하나요?** AI 생성 이미지는 크롭(예: 원하지 않는 배경 제거), 리사이즈(예: 로고용 정확한 500x500), 또는 타이포그래피 추가(예: 토큰 이름/심볼)가 필요할 수 있습니다. Photoshop은 고급 도구를 제공합니다; GIMP는 무료 옵션입니다
   - **단계:**
     - Photoshop이나 GIMP에서 각 이미지(예: `logo.png`) 열기
     - **배경 크롭:** "Magic Wand" 또는 "Lasso" 도구를 사용하여 원하지 않는 영역을 선택하고 제거, 가장자리 세밀 조정
     - **리사이즈:** "Image > Image Size"로 이동, 로고를 500x500 픽셀로, 배너를 1500x500 픽셀로 설정
     - **타이포그래피 추가:** "Text" 도구를 사용하여 "[your token name]" 또는 태그라인 추가(누락된 경우), 테마와 일치(예: 굵은 빨간색 폰트)
     - **저장:** 투명 배경으로 PNG로 내보내기(File > Export As > PNG)

7. **로컬에 이미지 저장:**
   - `memecoin-site-day1` 디렉토리에 `assets` 폴더 생성
   - 편집된 `logo.png`, `x-banner.png`, `dex-banner.png`를 `assets`로 이동
   - **참고:** 이미지는 게시 단계에서 GitHub Pages에 배포됩니다—지금은 로컬에 보관하세요

8. **도움을 위한 프롬프트:**
   - 도구가 작동하지 않으면 Cursor Chat에 물어보세요: "How to generate images with Grok 4 and ChatGPT? Provide sample prompts for a memecoin mascot logo, X banner, and DEX banner."

### 작업 4: 최고의 Solana 메메코인에서 영감을 받아 메메코인 웹사이트 스캐폴딩
**목표:** 모든 HTML, CSS(`<style>` 내), JavaScript(`<script>` 내)를 포함한 메메코인 웹사이트용 단일 `index.html` 파일을 생성하고, AI 생성 이미지 URL을 통합합니다. Cursor에서 재귀 프롬프팅을 사용하여 코드 프롬프트를 개선하고, 최고의 Solana 메메코인 웹사이트에서 영감을 받고, 이미지의 색상을 활용합니다.

1. **Grok 4로 영감 연구:**
   - Grok 4에 프롬프트: "Suggest 5 top-performing memecoin websites on Solana from 2025 (as of 02:45 PM CDT, August 02, 2025). Provide their URLs, key design features (e.g., bold hero, meme galleries), and why they work for viral marketing."
   - 예시 출력: "1. bonk.in - Bold hero with mascot, meme gallery, vibrant colors. 2. wifcoin.sol - Animated roadmap, community section, neon palette. 3. pepe.lol - Satirical design, tokenomics table, dark theme. 4. shibarmy.com - Dog-themed layout, how-to-buy guide, playful fonts. 5. metadog.io - Meta-narrative focus, interactive elements, sleek design."
   - 디자인을 위해 이 인사이트들을 기록하세요

2. **Cursor에서 재귀 프롬프팅으로 프롬프트 개선:**
   - Cursor Chat을 열고 프롬프트: "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links (X, TG, DexScreener placeholders), a buy button (placeholder for Raydium), and responsive meme gallery, inspired by top Solana memecoin designs (e.g., bonk.in, wifcoin.sol). Use a color palette from [describe images, e.g., red and white for Shiba theme]."
   - Cursor가 개선된 프롬프트를 출력할 것입니다, 예: "Use primary color #FF0000 for backgrounds, secondary #FFFFFF for accents."

3. **Cursor Composer 열기:**
   - Composer 열기(Ctrl+Shift+I 또는 Cmd+Shift+I)

4. **개선된 프롬프트를 Cursor Composer에 붙여넣기:**
   - Cursor Chat의 개선된 프롬프트를 붙여넣기(로컬 이미지 경로로 교체, 예: `assets/logo.png`, 그리고 선택한 개념; 게시 시 GitHub URL로 업데이트):
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
   - Cursor가 `memecoin-site-day1` 폴더에 `<style>`와 `<script>` 섹션이 포함된 `index.html`을 생성하고, 이미지의 색상과 영감 디자인을 사용합니다. 저장하세요

5. **코드 검토:**
   - Cursor에서 `index.html` 열기. `<section id="hero">`, `<table id="tokenomics">` 등과 같은 섹션이 존재하고, 로고, 소셜 링크, 구매 버튼이 로컬 경로를 통해 로드되는지 확인(게시 시 GitHub URL로 업데이트)
   - `<style>`에서 반응성, 색상 사용(예: `background: #FF0000;`), Solana에서 영감받은 요소(예: 생생한 레이아웃) 확인
   - `<script>`에서 기본 상호작용성(예: 콘솔 로그 또는 이벤트 리스너) 확인

6. **로컬 테스트:**
   - 브라우저에서 `index.html` 열기(더블클릭 또는 터미널에서 `open index.html` 실행)
   - 모든 섹션이 올바르게 표시되고, 로고가 로드되고, 색상이 이미지와 일치하고, 모바일 반응성(브라우저 크기 조정)을 확인하세요. 문제가 있으면 Cursor Chat에 물어보세요: "Fix my HTML/CSS layout in index.html or image loading errors."

### 작업 5: 웹사이트 반복
**목표:** AI 생성 개선사항으로 단일 페이지 사이트를 향상시키고, 상호작용성, 디자인, 그리고 최고의 Solana 메메코인에서 추가 영감을 얻습니다. 반복은 새로운 방향으로 재생성하거나 미묘한 애니메이션, 버튼 스타일링, 또는 타이포그래피 변경과 같은 작은 개선을 포함하며, 모두 프롬프트 엔지니어링을 통해 수행됩니다.

1. **반복에 대한 가이던스:**
   - **새로운 방향으로 재생성:** 초기 디자인이 맞지 않으면 Cursor에 새 스타일로 처음부터 시작하도록 프롬프트(예: "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design")
   - **작은 개선사항 만들기:** 미묘한 향상을 위한 프롬프트로 점진적으로 개선:
     - 미묘한 애니메이션 효과 추가(예: "Add a fade-in animation to the hero section")
     - 버튼 스타일링 개선(예: "Enhance the buy button with a gradient background and rounded corners")
     - 타이포그래피 변경(예: "Update all headings to use a bold, playful font inspired by shibarmy.com")
   - 전체 파일을 덮어쓰지 않기 위해 Composer를 타겟팅된 프롬프트에 사용(예: "Update only the <style> tag...")
   - 각 변경 후 테스트하여 기능성과 미학이 비전과 일치하는지 확인

2. **상호작용성 추가:**
   - Composer에서 Cursor에 프롬프트: "Add JavaScript in my index.html <script> tag to show an alert when clicking community links (e.g., 'Join our community!')."

3. **디자인 향상:**
   - Composer에서 Cursor에 프롬프트: "Enhance my index.html <style> tag with a subtle fade-in animation for the hero section, inspired by wifcoin.sol."

4. **구매 버튼 개선:**
   - Composer에서 Cursor에 프롬프트: "Improve the buy button in my index.html hero section with a gradient background and rounded corners, ensuring mobile-friendliness."

5. **타이포그래피 조정:**
   - Composer에서 Cursor에 프롬프트: "Change all headings in my index.html to use a bold, playful font inspired by shibarmy.com."

6. **로컬 저장:**
   - `index.html`에 변경사항 저장

7. **업데이트 확인:**
   - 브라우저에서 `index.html`을 다시 열어 변경사항 확인

8. **도움을 위한 프롬프트:**
   - 필요시 Cursor Chat에 물어보세요: "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

### 작업 6: 메메코인 웹사이트와 AI 이해
**목표:** 메메코인 웹사이트 요소의 목적과 AI가 개발을 어떻게 단순화하는지 학습합니다.

1. **설명을 위한 Cursor 프롬프트:**
   - 물어보세요: "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
   - 예상 답변:
     - Hero: 대담한 브랜딩으로 주의를 끌어들입니다
     - Tokenomics: 투명한 공급/분배로 신뢰를 구축합니다
     - Roadmap: 투자자들을 흥미롭게 하기 위한 미래 계획을 보여줍니다
     - How-to-buy: 신규 사용자를 위한 온보딩을 단순화합니다
     - Community: 소셜 플랫폼을 통해 참여를 촉진합니다
     - Meme gallery: 바이럴을 위해 유머를 사용합니다

2. **AI in Web3 퀴즈:**
   - Cursor에 프롬프트: "Create a 3-question quiz about how AI helps build websites, generate images, and manage socials, with answers. Example: How does Grok 4 or Cursor make image creation easier?"
   - 예시 답변:
     - Q: How does AI like Grok 4/Cursor help with images? A: Generates logos, banners, and memes from text prompts.
     - Q: What's an AI prompt for socials? A: A request like "Write a tweet for a memecoin launch."
     - Q: How is AI changing web dev? A: Speeds up coding, asset creation, and social automation.

3. **성찰:** Cursor에서 `notes.txt`를 만들고 작성: "How did AI help me with brainstorming, images, and site today?" (예: "Grok 4 brainstormed ideas, Cursor scaffolded the site!"). 로컬에 저장

### 작업 7: GitHub Pages에 게시
**목표:** Cursor를 사용하여 SSH 키를 생성하고 GitHub 인증을 설정하여 웹사이트와 이미지를 GitHub Pages에 배포합니다(수동 명령 불필요).

1. **Cursor로 SSH 키 생성:**
   - Cursor Chat을 열고 프롬프트: "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
   - Cursor의 지시를 따르세요(예: Cursor 내 터미널로 안내하고, `id_rsa`와 `id_rsa.pub` 같은 키를 생성하고, GitHub의 Settings > SSH and GPG keys > New SSH key에 공개 키를 복사하도록 프롬프트)

2. **Cursor로 GitHub 인증 설정:**
   - Cursor에 프롬프트: "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
   - Cursor의 안내를 따르세요(예: `memecoin-site-day1`이라는 이름의 저장소를 만들고, 연결하고, "Push my local memecoin-site-day1 folder to GitHub" 같은 프롬프트로 푸시하도록 제안)

3. **GitHub Pages에 배포:**
   - Cursor에 프롬프트: "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
   - Cursor가 GitHub Settings > Pages로 안내하고, 소스를 `main` 브랜치, `/ (root)` 폴더로 설정하고, `https://yourusername.github.io/memecoin-site-day1`에서 배포를 확인

4. **이미지 URL 업데이트:**
   - 배포 후 Cursor에 프롬프트: "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
   - 업데이트된 `index.html`을 저장하고 로컬에서 테스트

5. **도움을 위한 프롬프트:**
   - 문제가 있으면 Cursor Chat에 물어보세요: "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## Day 1의 Cursor 프롬프트
코스 저장소의 `docs/daily_prompts.md`에서 전체 목록을 확인하세요

- **재귀 프롬프팅:**
  - "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
  - "Refine this prompt for generating a single-page HTML memecoin website: Basic hero and tokenomics sections."
  - "Refine this prompt for an X banner: Space-themed banner for [your token name]."
  - "Suggest 5 top-performing memecoin websites on Solana from 2025. Provide their URLs, key design features, and why they work for viral marketing."
  - "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links, a buy button, and responsive meme gallery, inspired by top Solana memecoin designs."

- **이미지 생성(Grok 4/ChatGPT):**
  - "Generate a fun, vibrant mascot-focused logo for a memecoin called '[your token name]'. [Description from narrative, e.g., cute Shiba dog with laser eyes]. High resolution, 500x500 pixels, transparent background, PNG format."
  - "Create a banner image for an X profile for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Create a single banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Generate a small square image (400x400 pixels) for a tweet about '[your token name]' showing the mascot with a 'LFG LetsBonk!' text overlay, matching [your narrative]. PNG format."

- **스캐폴딩:**
  - "Generate a single static HTML page (index.html) for a memecoin called '[your token name]' with all HTML, CSS (in <style>), and JavaScript (in <script>). Include a bold hero section (coin name, tagline, logo URL, and a placeholder buy button), vibrant tokenomics table (1B supply, 50% community, 30% dev, 20% marketing), interactive roadmap timeline, clear how-to-buy guide, community links, and responsive meme gallery (4 placeholder URLs). Use semantic HTML, responsive design, and a fun aesthetic."
  - "Add semantic HTML to my index.html for a memecoin site with clear section IDs."
  - "Embed CSS in my index.html <style> tag for a mobile-responsive design inspired by top Solana memecoins."

- **반복:**
  - "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design."
  - "Add a subtle fade-in animation to the hero section of my index.html."
  - "Enhance the buy button in my index.html with a gradient background and rounded corners."
  - "Update all headings in my index.html to use a bold, playful font inspired by shibarmy.com."
  - "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

- **이해:**
  - "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
  - "What is a memecoin? Explain tokenomics and roadmaps in simple terms."
  - "How does Cursor AI speed up web development? Give 3 examples."
  - "How can AI like Grok 4 or Cursor generate images and tweets for memecoin projects?"

- **게시:**
  - "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
  - "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
  - "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
  - "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
  - "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## 학습 성과
- Grok 4와 재귀 프롬프팅을 사용하여 바이럴 메메코인 아이디어를 브레인스토밍하고, 강력한 내러티브를 가진 개념을 선택하고, Grok 4를 초기 연구/프롬프트 생성에 사용하여 Cursor용 프롬프트를 생성했습니다
- Grok 4와 ChatGPT를 사용하여 X 배너, DEX 배너, 마스코트 중심 로고를 생성하고, 개선을 위한 재귀 프롬프팅을 사용하고, Photoshop/GIMP에서 편집하고 로컬에 저장했습니다
- Cursor AI를 사용하여 단일 페이지 메메코인 웹사이트(`index.html`)를 구축하고 반복하고, Grok 4에서 개선된 프롬프트를 붙여넣고, 최고의 Solana 메메코인 디자인에서 영감을 받고, 소셜 링크와 구매 버튼을 포함했습니다
- Cursor의 Composer와 Chat을 사용하여 코드를 생성하고 문제를 해결했습니다
- 더 나은 AI 출력을 위한 재귀 프롬프팅을 학습했습니다
- (게시 단계) 배포를 위해 Cursor를 사용하여 SSH 키를 생성하고 GitHub 인증을 설정하는 방법을 학습했습니다

## 다음 단계
- `memecoin-site-day1` 폴더에 작업을 로컬로 저장하세요
- 브라우저에서 `index.html`을 열어 로컬 사이트를 확인하세요
- 내일(Day 2): AI로 메메코인 커뮤니티 구축에 깊이 들어가고, 프로젝트의 도달 범위를 확장하기 위해 Telegram과 X를 설정할 수 있습니다 