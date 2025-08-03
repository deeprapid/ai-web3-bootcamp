# 1日目: AIを使用したメメコインウェブサイトの構築とデプロイ

## 目標
- Grok 4を使用して初期リサーチ、プロンプト作成、再帰的プロンプティングによるバイラルメメコインアイデアのブレインストーミングを行い、強力なナラティブの構築に焦点を当て、Cursorに貼り付けるプロンプトを生成します。
- Grok 4またはChatGPTを軽く使用してメメコインウェブサイト用のXバナー、DexScreenerとDexTools両方用の単一DEXバナー、マスコット中心のロゴを生成します。
- Cursor AIを使用してメメコインウェブサイト用の単一静的HTMLページ（`index.html`）を生成し反復し、すべてのHTML、CSS（`<style>`内）、JavaScript（`<script>`内）を含み、主要要素：ヒーローセクション、トークノミクス、ロードマップ、購入方法ガイド、コミュニティリンク（X、TG、DexScreener用）、購入ボタン（Raydium用プレースホルダー）、ミームギャラリーを含み、トップSolanaメメコインウェブサイトからインスピレーションを得ます。
- サイトと画像をGitHub Pagesにデプロイしてライブ公開URLを取得し、すべてのプッシュで自動更新（別途Publishingステップで説明）。
- メメコインウェブサイトコンポーネントとAIがウェブ開発をどのように加速するかを理解します。
- 再帰的プロンプティングを学習：AIを使用してプロンプトを生成/改善し、その後その改善されたプロンプトを使用して他のもの（画像やコードなど）を作成します。
- （Publishingステップ）Cursorを使用してSSHキーを生成し、デプロイメント用のGitHub認証を設定する方法を学習します（手動コマンド不要）。

## 前提条件
- **ツール：** [Cursor](https://cursor.com/)をインストールし、オプションで[Adobe Photoshop](https://www.adobe.com/products/photoshop.html)または無料の代替品（例：GIMP）を画像編集用にインストール。（Node.jsとGitはPublishingステップまでオプション）
- **アカウント：** [GitHub](https://github.com/)アカウントを作成、[Grok 4](https://grok.com/)（画像生成などの高度な機能のためのPremium+またはSuperGrokサブスクリプション）、オプション[ChatGPT](https://chat.openai.com/)（DALL-E用、軽く使用）
- **知識：** 基本的なHTML（例：`<div>`タグ）、CSS（例：色のスタイリング）、JavaScript（例：簡単な関数）
- **注意：** 今日はドメイン購入などのコストを避けます。無料のGitHub Pages URL（`yourusername.github.io/memecoin-site`）を使用してください。Grok 4での画像生成にはサブスクリプションが必要です；バックアップとしてChatGPTを軽く使用してください。Photoshopにはサブスクリプションが必要です（約$20/月）またはGIMPなどの無料ツールを使用してください。トークンは後日LetsBonk.fun（Solanaメメコインローンチパッド）でローンチされます—今日の焦点はウェブサイトです。

## セットアップ：プロジェクト用のCursorの設定
**目標：** Cursorを主要なAIコーディングツールとして設定し、ローカルフォルダを作成し、ワークスペースに追加し、生成用のプロンプトボックスを使用します。

1. **Cursorのインストールと開く：**
   - [cursor.com](https://cursor.com/)からCursorをダウンロードしてインストールしてください
   - Cursorを開く—VS Codeのように見えますが、Composer（コード生成用）やChat（会話用）などのAI機能があります

2. **ローカルフォルダの作成：**
   - ファイルエクスプローラーでフォルダを作成：`mkdir memecoin-site-day1`
   - Cursorで開く：File > Open Folder > `memecoin-site-day1`を選択

3. **ワークスペースに追加：**
   - CursorでView > Command Palette（Ctrl+Shift+PまたはCmd+Shift+P）に移動し、「Workspaces: Add Folder to Workspace」を検索して`memecoin-site-day1`フォルダを選択
   - これによりCursorがAI操作のためにフォルダにアクセスできるようになります（例：その中にファイルを生成）

4. **プロンプトボックス（Composer）の使用：**
   - Ctrl+Shift+I（またはMacでCmd+Shift+I）でComposerを開く
   - 自然言語プロンプトを入力（例：「Generate a hello world HTML file」）—Cursorがリクエストに基づいてファイルを生成/編集します
   - Chat用：Chatサイドバー（アイコンまたはCtrl+Shift+L）を開いて質問や改善を行います

5. **ヒント：** CursorはGPT-4やClaudeなどのモデルを使用します—必要に応じて設定で構成してください。Composerはコードスキャフォールディング用、Chatはブレインストーミング用に使用してください

6. **ヘルプ用のプロンプト：**
   - Cursor Chatに聞いてください：「How do I set up a new project folder in Cursor and use Composer for code generation?」

## タスクと指示
これらのステップに従ってGrok 4でブレインストーミングし、画像/テキストを生成し、Cursorでメメコインウェブサイトを構築し反復し、Cursor AIでサイトを改善してください。Grok 4をリサーチ/プロンプト用に、Cursorをスキャフォールディング用に集中してください；Grok 4の画像生成が制限されている場合はChatGPTを軽く使用してください。Git関連のステップ（Publishing）は別途で、Cursorプロンプトで処理されます。

### タスク1：再帰的プロンプティングの紹介
**目標：** 再帰的プロンプティングを学習します—AIを使用してプロンプトを生成または改善し、その後その改善されたプロンプトを使用して他のもの（画像やコードなど）を作成する技術。これは反復的により良い結果を構築し、AIチェイニングを教えます。

1. **再帰的プロンプティングとは？**
   - AIにあなたがより良い質問をするのを手伝ってもらうようなものです。例えば、基本的なアイデア（「a rocket logo」）から始めて、AIを使用して詳細なプロンプト（「cartoon rocket with smiling face, blue/yellow, high-res」）を作成し、そのプロンプトを別のAIツールでロゴを生成するために使用します
   - なぜ？AIで改善されたプロンプトはより正確で創造的な出力につながります。手動調整なしで結果を最適化するAIエンジニアリングの鍵です

2. **CursorやGrok 4で練習：**
   - Cursor ChatやGrok 4を開いてプロンプト：「Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors.」
   - AIが出力する可能性のあるもの：「Generate a vibrant, cartoon-style logo for 'GrokCoin' featuring a rocket ship with a cute smiling face blasting through space, surrounded by stars and planets, in bright blue and yellow tones, high resolution, square format, transparent background.」
   - この改善されたプロンプトをコピーしてタスク3で画像生成に使用してください

3. **ウェブサイトコードに適用（オプションのプレビュー）：**
   - Cursorにプロンプト：「Create a refined prompt for generating a Next.js homepage for a memecoin site.」
   - ブートキャンプの後半で出力を使用してください—今日はブレインストーミングと画像に集中してください

4. **ヒント：** 再帰的プロンプティングは時間を節約します；最高の結果のために2-3回の反復をチェイニングしてください（例：プロンプト生成 > フィードバックで改善 > 最終使用）

### タスク2：Grok 4と再帰的プロンプティングを使用したメメコインアイデアのブレインストーミング
**目標：** Grok 4を使用して初期リサーチと10個のバイラルメメコインアイデアのブレインストーミングを行い、指定した個人的アイデアに基づきます（例：「my Shiba Inu dog named Kylieについてのメメコイン」）。コミュニティ、ミーム、トレンドを中心とした強力なナラティブを構築してバイラリティに集中します。再帰的プロンプティングを使用してコンセプト（トークン名、シンボル、ナラティブ）を改善し選択し、Cursorに貼り付けるプロンプトを生成します。「メタ」と他のコンセプトを理解します。

1. **「メタ」と他のメメコインコンセプトの理解：**
   - **メタメメコイン：** これらは現在バイラルまたは人気のあるものを反映し、X、TikTok、政治、または暗号文化のトレンディングトピックを活用します（例：メメコインについてのコイン、現在のトレンド、または「CoinAboutCoins」のような風刺）。彼らはユーモア、タイムリーな参照（例：2025年選挙ミーム）、プラットフォーム固有の内輪ネタを通じてバイラルになり、ソーシャルメディアで急速に広がります。例：PEPE（カエルミームメタ）は文化的トレンドを活用しました
   - **アニマルコンセプト（例：犬、動物）：** これらはかわいい/関連性のあるテーマに依存します（例：Dogecoinの柴犬は楽しさ/忠誠心用）。彼らは感情的な魅力、コミュニティエアドロップ、そして支持（例：Elon MuskのDOGE）を通じてバイラルに広がります。2025年、Dogwifhat（WIF）のようなアニマルコインはシェア可能なマスコットで成功しますが飽和に直面します—メタコインは現在のハイプに合わせて際立っています
   - **バイラリティのヒント：** 強力なナラティブ（ストーリー + 感情）、ミームポテンシャル（リミックス可能なコンテンツ）、コミュニティフック（エアドロップ、コンテスト）を持つコンセプトを目指してください。メタコンセプトはトレンドで繁栄します（例：Xハッシュタグ#SolanaSzn）；アニマルは疲労を避けるために新鮮なスピンが必要です

2. **Grok 4にアクセス：**
   - [grok.com](https://grok.com/)またはXアプリに移動し、サインイン（Grok 4の高度な機能のためのPremium+またはSuperGrokが必要）

3. **Grok 4での初期リサーチ：**
   - Grok 4にプロンプト：「Research successful viral memecoin concepts from 2025 (as of 02:45 PM CDT, August 02, 2025). What makes them viral? Provide 5 examples with token name, symbol, narrative, and key success factors (e.g., community, memes). Compare 'meta' (trending topics) concepts vs. animal-themed ones like dogs.」
   - インサイトを使用してブレインストーミングを導きます（例：PEPEのようなメタコインはトレンドで繁栄；DOGEのような犬コインは支持で）

4. **あなたのアイデアから始める：**
   - 個人的テーマを決定（例：「my Shiba Inu dog named Kylieについてのメメコイン」または「AIエンジニアについてのメメコイン」）
   - Grok 4で再帰的プロンプティングを使用：「Generate a refined prompt for brainstorming 10 viral memecoin ideas based on: [your idea]. Emphasize virality through strong narratives, meme potential, community engagement, and current trends on X or TikTok. Include token name, symbol, and narrative for each, highlighting if it's 'meta' or animal-themed. Format the output as a single prompt to paste into Cursor for website generation.」
   - 例の改善された出力：「Brainstorm 10 creative, viral memecoin concepts based on a Shiba Inu dog named Kylie. For each, provide a catchy token name, 3-letter symbol, and a short narrative (50-100 words) that builds hype with meme virality, community angle, and trending elements from X/TikTok. Note if it's 'meta' (trending topics) or animal-themed. Output as a single prompt to paste into Cursor for generating a website: 'Generate a single static HTML page (index.html) for a memecoin called [token name] with all HTML, CSS (in <style> tags), and JavaScript (in <script> tags). Include a bold hero section with coin name [token name], tagline [narrative summary], and mascot logo image, a vibrant tokenomics table, an interactive roadmap, a clear how-to-buy guide, community links, a buy button, and a responsive meme gallery, using a color palette inspired by [theme colors]. Use semantic HTML, responsive design, and a fun aesthetic inspired by top Solana memecoins.'」

5. **Grok 4でブレインストーミング：**
   - 改善されたプロンプトをGrok 4に貼り付け
   - Grokが10個のアイデアを出力します、例：
     - アイデア1（アニマルテーマ）：トークン名：KylieShib、シンボル：KYL、ナラティブ：「KylieShib is the ultimate doggo coin for Shiba lovers! Inspired by your loyal Kylie, this memecoin celebrates fluffy adventures and airdrops tied to #DogTok trends. Join for meme contests—viral with cute pup videos!」
     - アイデア2（メタ）：トークン名：KylieMeta、シンボル：KMT、ナラティブ：「KylieMeta mocks 2025's crypto hype! Kylie the Shiba 'meta-dog' roasts TikTok pump-and-dumps with irony. Narrative: A coin trending with #SolanaSzn—viral via X satire!」
   - アイデアをレビューし、メタ（トレンディング、持続可能なハイプ）とアニマル（かわいい、急速なバイラリティだが流行のリスク）を比較

6. **再帰的に選択を改善：**
   - 必要に応じて、Grok 4にプロンプト：「Refine my top 3 memecoin ideas from the list to maximize virality: Strengthen narratives with current X/TikTok trends, meme templates, and LetsBonk integration. Explain why a meta concept might outperform animal ones in 2025.」
   - 強力なナラティブ（例：ストーリー + ミーム + トレンド）を持つバイラルコンセプト（トークン名、シンボル、ナラティブ）を最終決定し—すべての後続タスクをそれで更新してください

7. **ヘルプ用のプロンプト：**
   - Cursor Chatに聞いてください：「Help me select the most viral memecoin concept from Grok 4's brainstorm list, focusing on narrative strength and meta vs. animal tradeoffs.」

### タスク3：AIを使用したXバナー、DEXバナー、ロゴの生成（Grok 4とChatGPT）
**目標：** Grok 4とChatGPTを使用してメメコインウェブサイト用のXバナー、DexScreenerとDexTools両方用の単一DEXバナー、マスコット中心のロゴを生成します。Grok 4で再帰的プロンプティングを使用してプロンプトを改善し、Publishingまでローカルに画像を保存します。画像はPhotoshopまたは無料の代替品で編集が必要な場合があります。

1. **AIツールの選択：**
   - **Grok 4：** 初期プロンプト改善と画像生成のために[grok.com](https://grok.com/)またはXアプリを使用（Grok 4のAuroraまたは類似機能を通じて）
   - **ChatGPT（DALL-E）：** Grok 4の出力が制限されている場合の最終画像生成に[chat.openai.com](https://chat.openai.com/)を使用（Plusサブスクリプションが必要）

2. **Grok 4での再帰的プロンプティングによるプロンプトの改善：**
   - Grok 4にプロンプト：「Generate a refined prompt for a mascot-focused logo based on [your narrative]. Example: Cute Shiba dog with accessories.」
   - 例の改善された出力：「Generate a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in bright red and white colors. High resolution, square format (e.g., 500x500 pixels), transparent background, PNG format.」

3. **ロゴの生成：**
   - 改善されたプロンプトをGrok 4に貼り付けて初期生成。満足でない場合、ChatGPTで改善：「Create a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in red and white, 500x500 pixels, transparent PNG.」
   - `logo.png`としてダウンロード

4. **Xバナーの生成：**
   - 改善されたプロンプト（Grok 4で改善するために使用）：「Create a banner image for an X (Twitter) profile for '[your token name]'. Feature the mascot, tagline based on [your narrative], and elements like [theme, e.g., dogs in space]. High resolution, 1500x500 pixels, PNG format.」
   - Grok 4を使用し、必要に応じてChatGPTで改善：「Design an X banner for 'KylieShib' with a Shiba dog mascot, 'Loyal to the Moon' tagline, and space theme, 1500x500 pixels, PNG.」
   - `x-banner.png`としてダウンロード

5. **DEXバナーの生成（DexScreenerとDexTools用）：**
   - 改善されたプロンプト：「Create a banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. High resolution, 1500x500 pixels, PNG format.」
   - Grok 4を使用し、必要に応じてChatGPTで改善：「Create a DEX banner for 'KylieShib' with a Shiba dog mascot, 'To the Moon' tagline, and space theme, 1500x500 pixels, PNG.」
   - `dex-banner.png`としてダウンロード

6. **Photoshopまたは無料の代替品での画像編集：**
   - **なぜ編集する？** AI生成画像はクロッピング（例：不要な背景の削除）、リサイズ（例：ロゴ用の正確な500x500）、タイポグラフィの追加（例：トークン名/シンボル）が必要な場合があります。Photoshopは高度なツールを提供；GIMPは無料オプション
   - **ステップ：**
     - 各画像（例：`logo.png`）をPhotoshopまたはGIMPで開く
     - **背景のクロップ：** 「Magic Wand」または「Lasso」ツールを使用して不要な領域を選択し削除、エッジを改善
     - **リサイズ：** 「Image > Image Size」に移動し、ロゴを500x500ピクセル、バナーを1500x500ピクセルに設定
     - **タイポグラフィの追加：** 「Text」ツールを使用して「[your token name]」またはタグラインを追加（不足している場合）、テーマに合わせて（例：太い赤いフォント）
     - **保存：** 透明背景でPNGとしてエクスポート（File > Export As > PNG）
   - **ヒント：** 編集が初めての場合、クイックチュートリアルを見る（例：YouTube検索「GIMP basics」）またはCursor Chatに聞く：「Guide me to crop and resize an image in Photoshop/GIMP.」

7. **ローカルに画像を保存：**
   - `memecoin-site-day1`ディレクトリに`assets`フォルダを作成
   - 編集された`logo.png`、`x-banner.png`、`dex-banner.png`を`assets`に移動
   - **注意：** 画像はPublishingステップでGitHub Pagesにデプロイされます—今はローカルに保持

8. **ヘルプ用のプロンプト：**
   - ツールが動作しない場合、Cursor Chatに聞く：「How to generate images with Grok 4 and ChatGPT? Provide sample prompts for a memecoin mascot logo, X banner, and DEX banner.」

### タスク4：トップSolanaメメコインからのインスピレーションでメメコインウェブサイトのスキャフォールド
**目標：** すべてのHTML、CSS（`<style>`内）、JavaScript（`<script>`内）を含むメメコインウェブサイト用の単一`index.html`ファイルを作成し、AI生成画像URLを組み込みます。Cursorで再帰的プロンプティングを使用してトップSolanaメメコインウェブサイトからのインスピレーションでコードプロンプトを改善し、画像からの色を活用します。

1. **Grok 4でのインスピレーションリサーチ：**
   - Grok 4にプロンプト：「Suggest 5 top-performing memecoin websites on Solana from 2025 (as of 02:45 PM CDT, August 02, 2025). Provide their URLs, key design features (e.g., bold hero, meme galleries), and why they work for viral marketing.」
   - 例の出力：「1. bonk.in - Bold hero with mascot, meme gallery, vibrant colors. 2. wifcoin.sol - Animated roadmap, community section, neon palette. 3. pepe.lol - Satirical design, tokenomics table, dark theme. 4. shibarmy.com - Dog-themed layout, how-to-buy guide, playful fonts. 5. metadog.io - Meta-narrative focus, interactive elements, sleek design.」
   - デザインのためのこれらのインサイトをメモ

2. **Cursorでの再帰的プロンプティングによるプロンプトの改善：**
   - Cursor Chatを開いてプロンプト：「Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links (X, TG, DexScreener placeholders), a buy button (placeholder for Raydium), and responsive meme gallery, inspired by top Solana memecoin designs (e.g., bonk.in, wifcoin.sol). Use a color palette from [describe images, e.g., red and white for Shiba theme].」
   - Cursorが改善されたプロンプトを出力します、例：「Use primary color #FF0000 for backgrounds, secondary #FFFFFF for accents.」

3. **Cursor Composerを開く：**
   - Composerを開く（Ctrl+Shift+IまたはCmd+Shift+I）

4. **Cursor Composerに改善されたプロンプトを貼り付け：**
   - Cursor Chatからの改善されたプロンプトを貼り付け（ローカル画像パスに置き換え、例：`assets/logo.png`、選択したコンセプト；PublishingでGitHub URLに更新）：
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
   - Cursorが`memecoin-site-day1`フォルダに`index.html`を生成し、埋め込まれた`<style>`と`<script>`セクション、画像からの色とインスピレーションされたデザインを使用。保存

5. **コードのレビュー：**
   - Cursorで`index.html`を開く。`<section id="hero">`、`<table id="tokenomics">`などのセクションが存在し、ロゴ、ソーシャルリンク、購入ボタンがローカルパス経由で読み込まれることを確認（PublishingでGitHub URLに更新）
   - `<style>`でレスポンシブネス、色の使用（例：`background: #FF0000;`）、Solanaインスピレーション要素（例：バイブレントレイアウト）をチェック
   - `<script>`で基本的なインタラクティビティ（例：コンソールログやイベントリスナー）をチェック

6. **ローカルでテスト：**
   - ブラウザで`index.html`を開く（ダブルクリックまたはターミナルで`open index.html`を実行）
   - すべてのセクションが正しく表示され、ロゴが読み込まれ、色が画像と一致し、モバイルレスポンシブ（ブラウザをリサイズ）であることを確認。問題が発生した場合、Cursor Chatに聞く：「Fix my HTML/CSS layout in index.html or image loading errors.」

### タスク5：ウェブサイトの反復
**目標：** インタラクティビティ、デザイン、トップSolanaメメコインからの追加インスピレーションのためのAI生成改善でシングルページサイトを強化します。反復には新しい方向性での再生成または微妙なアニメーション、ボタンスタイリング、タイポグラフィ変更などの小さな改善が含まれ、すべてプロンプトエンジニアリングを通じて行われます。

1. **反復に関するガイダンス：**
   - **新しい方向性で再生成：** 初期デザインが合わない場合、Cursorに新しいスタイルで新しく始めるようプロンプト（例：「Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design」）
   - **小さな改善を行う：** 微妙な強化のためのプロンプトで段階的に改善：
     - 微妙なアニメーション効果を追加（例：「Add a fade-in animation to the hero section」）
     - ボタンスタイリングを改善（例：「Enhance the buy button with a gradient background and rounded corners」）
     - タイポグラフィを変更（例：「Update all headings to use a bold, playful font inspired by shibarmy.com」）
   - ファイル全体を上書きしないようにターゲットプロンプトにComposerを使用（例：「Update only the <style> tag...」）
   - 各変更後にテストして機能性と美学がビジョンに合致することを確認

2. **インタラクティビティを追加：**
   - ComposerでCursorにプロンプト：「Add JavaScript in my index.html <script> tag to show an alert when clicking community links (e.g., 'Join our community!').」

3. **デザインを強化：**
   - ComposerでCursorにプロンプト：「Enhance my index.html <style> tag with a subtle fade-in animation for the hero section, inspired by wifcoin.sol.」

4. **購入ボタンを改善：**
   - ComposerでCursorにプロンプト：「Improve the buy button in my index.html hero section with a gradient background and rounded corners, ensuring mobile-friendliness.」

5. **タイポグラフィを調整：**
   - ComposerでCursorにプロンプト：「Change all headings in my index.html to use a bold, playful font inspired by shibarmy.com.」

6. **ローカルに保存：**
   - 変更を`index.html`に保存

7. **更新を確認：**
   - ブラウザで`index.html`を再開して変更を確認

8. **ヘルプ用のプロンプト：**
   - 必要に応じて、Cursor Chatに聞く：「Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io.」

### タスク6：メメコインウェブサイトとAIの理解
**目標：** メメコインサイト要素の目的とAIが開発をどのように簡素化するかを学習します。

1. **Cursorに説明をプロンプト：**
   - 聞く：「Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?」
   - 期待される回答：
     - Hero：大胆なブランディングで注意を引く
     - Tokenomics：透明な供給/配布で信頼を構築
     - Roadmap：投資家を興奮させる将来の計画を示す
     - How-to-buy：新規ユーザーのオンボーディングを簡素化
     - Community：ソーシャルプラットフォームを通じてエンゲージメントを促進
     - Meme gallery：バイラリティのためにユーモアを使用

2. **Web3でのAIクイズ：**
   - Cursorにプロンプト：「Create a 3-question quiz about how AI helps build websites, generate images, and manage socials, with answers. Example: How does Grok 4 or Cursor make image creation easier?」
   - 例の回答：
     - Q: How does AI like Grok 4/Cursor help with images? A: Generates logos, banners, and memes from text prompts.
     - Q: What's an AI prompt for socials? A: A request like "Write a tweet for a memecoin launch."
     - Q: How is AI changing web dev? A: Speeds up coding, asset creation, and social automation.

3. **反省：** Cursorで`notes.txt`を作成し、記述：「How did AI help me with brainstorming, images, and site today?」（例：「Grok 4 brainstormed ideas, Cursor scaffolded the site!」）。ローカルに保存

### タスク7：GitHub PagesへのPublishing
**目標：** Cursorを使用してSSHキーを生成し、GitHub認証を設定してウェブサイトと画像をGitHub Pagesにデプロイします（手動コマンド不要）。

1. **CursorでSSHキーを生成：**
   - Cursor Chatを開いてプロンプト：「Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account.」
   - Cursorの指示に従う（例：Cursor内のターミナルに案内し、`id_rsa`や`id_rsa.pub`のようなキーを生成し、Settings > SSH and GPG keys > New SSH keyでGitHubに公開キーをコピーするようプロンプト）

2. **CursorでGitHub認証を設定：**
   - Cursorにプロンプト：「Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project.」
   - Cursorのガイダンスに従う（例：`memecoin-site-day1`という名前のリポジトリを作成し、リンクし、「Push my local memecoin-site-day1 folder to GitHub」のようなプロンプトでプッシュすることを提案）

3. **GitHub Pagesにデプロイ：**
   - Cursorにプロンプト：「Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch.」
   - CursorがGitHub Settings > Pagesに案内し、ソースを`main`ブランチ、`/ (root)`フォルダに設定し、`https://yourusername.github.io/memecoin-site-day1`でのデプロイを確認

4. **画像URLを更新：**
   - デプロイ後、Cursorにプロンプト：「Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder.」
   - 更新された`index.html`を保存しローカルでテスト

5. **ヘルプ用のプロンプト：**
   - 問題が発生した場合、Cursor Chatに聞く：「Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project.」

## Day 1用のCursorプロンプト
コースリポジトリの`docs/daily_prompts.md`で完全なリストを参照。

- **再帰的プロンプティング：**
  - "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
  - "Refine this prompt for generating a single-page HTML memecoin website: Basic hero and tokenomics sections."
  - "Refine this prompt for an X banner: Space-themed banner for [your token name]."
  - "Suggest 5 top-performing memecoin websites on Solana from 2025. Provide their URLs, key design features, and why they work for viral marketing."
  - "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links, a buy button, and responsive meme gallery, inspired by top Solana memecoin designs."

- **画像生成（Grok 4/ChatGPT）：**
  - "Generate a fun, vibrant mascot-focused logo for a memecoin called '[your token name]'. [Description from narrative, e.g., cute Shiba dog with laser eyes]. High resolution, 500x500 pixels, transparent background, PNG format."
  - "Create a banner image for an X profile for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Create a single banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. 1500x500 pixels, PNG format."
  - "Generate a small square image (400x400 pixels) for a tweet about '[your token name]' showing the mascot with a 'LFG LetsBonk!' text overlay, matching [your narrative]. PNG format."

- **スキャフォールド：**
  - "Generate a single static HTML page (index.html) for a memecoin called '[your token name]' with all HTML, CSS (in <style>), and JavaScript (in <script>). Include a bold hero section (coin name, tagline, logo URL, and a placeholder buy button), vibrant tokenomics table (1B supply, 50% community, 30% dev, 20% marketing), interactive roadmap timeline, clear how-to-buy guide, community links, and responsive meme gallery (4 placeholder URLs). Use semantic HTML, responsive design, and a fun aesthetic."
  - "Add semantic HTML to my index.html for a memecoin site with clear section IDs."
  - "Embed CSS in my index.html <style> tag for a mobile-responsive design inspired by top Solana memecoins."

- **反復：**
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

- **Publishing：**
  - "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
  - "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
  - "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
  - "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
  - "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## 学習成果
- Grok 4と再帰的プロンプティングを使用してバイラルメメコインアイデアをブレインストーミングし、強力なナラティブを持つコンセプトを選択し、初期リサーチ/プロンプト作成にGrok 4を使用し、Cursor用のプロンプトを生成しました。
- Grok 4とChatGPTを使用してXバナー、DEXバナー、マスコット中心のロゴを生成し、改善のための再帰的プロンプティング、Photoshop/GIMPでの編集、ローカル保存を行いました。
- Cursor AIを使用してシングルページメメコインウェブサイト（`index.html`）をAI生成アセットで構築し反復し、Grok 4からの改善されたプロンプトを貼り付け、トップSolanaメメコインデザインからインスピレーションを得て、ソーシャルリンクと購入ボタンを含みました。
- CursorのComposerとChatを使用してコードを生成し、問題をトラブルシュートしました。
- より良いAI出力のための再帰的プロンプティングを学習しました。
- （Publishingステップ）デプロイメント用のSSHキーを生成し、GitHub認証を設定するためにCursorを使用する方法を学習しました。

## 次のステップ
- `memecoin-site-day1`フォルダに作業をローカルに保存。
- ブラウザで`index.html`を開いてローカルサイトを確認。
- 明日（Day 2）：AIを使用したメメコインコミュニティの構築に取り組み、プロジェクトのリーチを拡大するためにTelegramとXの設定を潜在的に行います。 