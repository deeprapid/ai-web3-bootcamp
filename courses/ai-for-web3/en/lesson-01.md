# Lesson 1: Building and Deploying Your Memecoin Website with AI

## Objectives
- Use Grok 4 for initial research, prompt creation, and brainstorming viral memecoin ideas with recursive prompting, focusing on building a strong narrative, resulting in a prompt to paste into Cursor.
- Use Grok 4 or lightly ChatGPT for generating an X banner, a single DEX banner for both DexScreener and DexTools, and a mascot-focused logo for your memecoin website.
- Use Cursor AI to generate and iterate on a single static HTML page (`index.html`) for a memecoin website, embedding all HTML, CSS (in `<style>`), and JavaScript (in `<script>`), with key elements: hero section, tokenomics, roadmap, how-to-buy guide, community links (for X, TG, DexScreener), a buy button (placeholder for Raydium), and meme gallery, inspired by top Solana memecoin websites.
- Deploy the site and images to GitHub Pages for a live, public URL with automated updates on every push (covered in a separate Publishing step).
- Understand memecoin website components and how AI accelerates web development.
- Learn recursive prompting: Use AI to generate/refine prompts that are then used to create images or code.
- (Publishing Step) Learn to use Cursor to generate SSH keys and set up GitHub authentication for deployment (no manual commands required).

## Prerequisites
- **Tools:** Install [Cursor](https://cursor.com/), and optionally [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) or a free alternative (e.g., GIMP) for image editing. (Node.js and Git optional until Publishing step.)
- **Accounts:** Create a [GitHub](https://github.com/) account, [Grok 4](https://grok.com/) (via Premium+ or SuperGrok subscription for advanced features like image gen), optional [ChatGPT](https://chat.openai.com/) (for DALL-E, lightly used).
- **Knowledge:** Basic HTML (e.g., `<div>` tags), CSS (e.g., styling colors), JavaScript (e.g., simple functions).
- **Note:** This day avoids costs like domain purchases. Use the free GitHub Pages URL (`yourusername.github.io/memecoin-site`). Image generation with Grok 4 requires a subscription; lightly use ChatGPT as a backup. Photoshop requires a subscription (~$20/month) or use free tools like GIMP. The token will be launched on LetsBonk.fun (a Solana memecoin launchpad) in later days—today's focus is the website.

## Setup: Configuring Cursor for Your Project
**Goal:** Set up Cursor as your primary AI coding tool, create a local folder, add it to the workspace, and use the prompt box for generation.

1. **Install and Open Cursor:**
   - Download and install Cursor from [cursor.com](https://cursor.com/).
   - Open Cursor—it looks like VS Code but with AI features like Composer (for code gen) and Chat (for conversations).
2. **Create a Local Folder:**
   - In your file explorer, create a folder: `mkdir memecoin-site-day1`.
   - Open it in Cursor: File > Open Folder > Select `memecoin-site-day1`.
3. **Add to Workspace:**
   - In Cursor, go to View > Command Palette (Ctrl+Shift+P or Cmd+Shift+P), search "Workspaces: Add Folder to Workspace," and select your `memecoin-site-day1` folder.
   - This lets Cursor access the folder for AI operations (e.g., generating files inside it).
4. **Use the Prompt Box (Composer):**
   - Open Composer with Ctrl+Shift+I (or Cmd+Shift+I on Mac).
   - Type natural language prompts (e.g., "Generate a hello world HTML file")—Cursor will create/edit files based on your request.
   - For Chat: Open Chat sidebar (icon or Ctrl+Shift+L) for questions or refinements.
5. **Tip:** Cursor uses models like GPT-4 or Claude—configure in Settings if needed. Use Composer for code scaffolding, Chat for brainstorming.
6. **Prompt for Help:**
   - Ask Cursor Chat: "How do I set up a new project folder in Cursor and use Composer for code generation?"

## Tasks & Instructions
Follow these steps to brainstorm with Grok 4, generate images/text, build and iterate on your memecoin website in Cursor, and improve your site using Cursor AI. Focus on Grok 4 for research/prompts and Cursor for scaffolding; lightly use ChatGPT for images if Grok 4's image gen is limited. Git-related steps (Publishing) are separate and handled with Cursor prompts.

### Task 1: Introduction to Recursive Prompting
**Goal:** Learn recursive prompting—a technique where you use AI to generate or refine a prompt, then use that improved prompt to create something else (e.g., an image or code). This builds better results iteratively and teaches AI chaining.

1. **What is Recursive Prompting?**
   - It's like asking AI to help you ask better questions. For example, start with a basic idea ("a rocket logo"), use AI to craft a detailed prompt ("cartoon rocket with smiling face, blue/yellow, high-res"), then use that prompt in another AI tool to generate the logo.
   - Why? AI-refined prompts lead to more precise, creative outputs. It's key in AI engineering for optimizing results without manual tweaking.
2. **Practice with Cursor or Grok 4:**
   - Open Cursor Chat or Grok 4 and prompt: "Generate a detailed prompt for creating a memecoin logo using Grok 4 image gen. My idea: a cartoon rocket ship in space with smiling face, bright colors."
   - The AI might output: "Generate a vibrant, cartoon-style logo for 'GrokCoin' featuring a rocket ship with a cute smiling face blasting through space, surrounded by stars and planets, in bright blue and yellow tones, high resolution, square format, transparent background."
   - Copy this refined prompt and use it in Task 3 for image generation.
3. **Apply to Website Code (Optional Preview):**
   - Prompt Cursor: "Create a refined prompt for generating a Next.js homepage for a memecoin site."
   - Use the output later in the bootcamp—today, focus on brainstorming and images.
4. **Tip:** Recursive prompting saves time; chain 2-3 iterations for best results (e.g., generate prompt > refine with feedback > final use).

### Task 2: Brainstorm Memecoin Ideas Using Grok 4 with Recursive Prompting
**Goal:** Use Grok 4 for initial research and brainstorming 10 viral memecoin ideas based on a personal idea you specify (e.g., "a memecoin about my Shiba Inu dog named Kylie"). Focus on virality by building a strong narrative around community, memes, and trends. Use recursive prompting to refine and select a concept (token name, symbol, narrative), resulting in a prompt to paste into Cursor. Understand "meta" vs. other concepts.

1. **Understand "Meta" vs. Other Memecoin Concepts:**
   - **Meta Memecoins:** These reflect what’s viral or popular right now, tapping into trending topics on X, TikTok, politics, or crypto culture (e.g., coins about memecoins, current trends, or satire like "CoinAboutCoins"). They go viral through humor, timely references (e.g., 2025 election memes), and platform-specific in-jokes, spreading rapidly on social media. Example: PEPE (frog meme meta) leveraged cultural trends.
   - **Animal Concepts (e.g., Dogs, Animals):** These rely on cute/relatable themes (e.g., Dogecoin's Shiba Inu dog for fun/loyalty). They virally spread via emotional appeal, community airdrops, and endorsements (e.g., Elon Musk for DOGE). In 2025, animal coins like Dogwifhat (WIF) succeed with shareable mascots but face saturation—meta coins stand out by aligning with current hype.
   - **Virality Tips:** Aim for concepts with strong narratives (story + emotion), meme potential (remixable content), and community hooks (airdrops, contests). Meta concepts thrive on trends (e.g., X hashtags #SolanaSzn); animal ones need fresh spins to avoid fatigue.
2. **Access Grok 4:**
   - Go to [grok.com](https://grok.com/) or the X app, sign in (Premium+ or SuperGrok required for Grok 4).
3. **Initial Research with Grok 4:**
   - Prompt Grok 4: "Research successful viral memecoin concepts from 2025 (as of 02:45 PM CDT, August 02, 2025). What makes them viral? Provide 5 examples with token name, symbol, narrative, and key success factors (e.g., community, memes). Compare 'meta' (trending topics) concepts vs. animal-themed ones like dogs."
   - Use insights to inform your brainstorming (e.g., meta coins like PEPE thrive on trends; dog coins like DOGE on endorsements).
4. **Start with Your Idea:**
   - Decide on a personal theme (e.g., "memecoin about my Shiba Inu dog named Kylie" or "memecoin about AI engineers").
   - Use recursive prompting in Grok 4: "Generate a refined prompt for brainstorming 10 viral memecoin ideas based on: [your idea]. Emphasize virality through strong narratives, meme potential, community engagement, and current trends on X or TikTok. Include token name, symbol, and narrative for each, highlighting if it's 'meta' or animal-themed. Format the output as a single prompt to paste into Cursor for website generation."
   - Example refined output: "Brainstorm 10 creative, viral memecoin concepts based on a Shiba Inu dog named Kylie. For each, provide a catchy token name, 3-letter symbol, and a short narrative (50-100 words) that builds hype with meme virality, community angle, and trending elements from X/TikTok. Note if it's 'meta' (trending topics) or animal-themed. Output as a single prompt to paste into Cursor for generating a website: 'Generate a single static HTML page (index.html) for a memecoin called [token name] with all HTML, CSS (in <style> tags), and JavaScript (in <script> tags). Include a bold hero section with coin name [token name], tagline [narrative summary], and mascot logo image, a vibrant tokenomics table, an interactive roadmap, a clear how-to-buy guide, community links, a buy button, and a responsive meme gallery, using a color palette inspired by [theme colors]. Use semantic HTML, responsive design, and a fun aesthetic inspired by top Solana memecoins.'"
5. **Brainstorm with Grok 4:**
   - Paste the refined prompt into Grok 4.
   - Grok will output 10 ideas, e.g.:
     - Idea 1 (Animal-Themed): Token Name: KylieShib, Symbol: KYL, Narrative: "KylieShib is the ultimate doggo coin for Shiba lovers! Inspired by your loyal Kylie, this memecoin celebrates fluffy adventures and airdrops tied to #DogTok trends. Join for meme contests—viral with cute pup videos!"
     - Idea 2 (Meta): Token Name: KylieMeta, Symbol: KMT, Narrative: "KylieMeta mocks 2025’s crypto hype! Kylie the Shiba 'meta-dog' roasts TikTok pump-and-dumps with irony. Narrative: A coin trending with #SolanaSzn—viral via X satire!"
   - Review ideas, comparing meta (trending, sustainable hype) vs. animal (cute, quick virality but risk of fad).
6. **Refine Selection Recursively:**
   - If needed, prompt Grok 4: "Refine my top 3 memecoin ideas from the list to maximize virality: Strengthen narratives with current X/TikTok trends, meme templates, and LetsBonk integration. Explain why a meta concept might outperform animal ones in 2025."
   - Finalize a viral concept (token name, symbol, narrative) with a strong narrative (e.g., story + memes + trends)—update all subsequent tasks with it.
7. **Prompt for Help:**
   - Ask Cursor Chat: "Help me select the most viral memecoin concept from Grok 4's brainstorm list, focusing on narrative strength and meta vs. animal tradeoffs."

### Task 3: Generate X Banner, DEX Banner, and Logo Using AI (Grok 4 and ChatGPT)
**Goal:** Create an X banner, a single DEX banner for both DexScreener and DexTools, and a mascot-focused logo for your memecoin website using Grok 4 and ChatGPT. Use recursive prompting in Grok 4 to refine prompts and store images locally until Publishing. Note that images may need editing in Photoshop or a free alternative.

1. **Choose Your AI Tools:**
   - **Grok 4:** Use [grok.com](https://grok.com/) or X app for initial prompt refinement and image gen (via Aurora or similar in Grok 4).
   - **ChatGPT (DALL-E):** Use [chat.openai.com](https://chat.openai.com/) for final image generation if Grok 4's output is limited (Plus subscription needed).
2. **Refine Prompts with Recursive Prompting in Grok 4:**
   - Prompt Grok 4: "Generate a refined prompt for a mascot-focused logo based on [your narrative]. Example: Cute Shiba dog with accessories."
   - Example refined output: "Generate a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in bright red and white colors. High resolution, square format (e.g., 500x500 pixels), transparent background, PNG format."
3. **Generate the Logo:**
   - Paste the refined prompt into Grok 4 for initial gen. If unsatisfactory, refine in ChatGPT with: "Create a mascot-focused logo for 'KylieShib' featuring a cute Shiba Inu dog named Kylie with laser eyes, in red and white, 500x500 pixels, transparent PNG."
   - Download as `logo.png`.
4. **Generate the X Banner:**
   - Refined Prompt (use Grok 4 to improve): "Create a banner image for an X (Twitter) profile for '[your token name]'. Feature the mascot, tagline based on [your narrative], and elements like [theme, e.g., dogs in space]. High resolution, 1500x500 pixels, PNG format."
   - Use Grok 4, then refine in ChatGPT if needed: "Design an X banner for 'KylieShib' with a Shiba dog mascot, 'Loyal to the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - Download as `x-banner.png`.
5. **Generate the DEX Banner (for DexScreener and DexTools):**
   - Refined Prompt: "Create a banner image for DexScreener and DexTools for '[your token name]'. Feature the mascot, tagline from [your narrative], and theme elements. High resolution, 1500x500 pixels, PNG format."
   - Use Grok 4, then refine in ChatGPT if needed: "Create a DEX banner for 'KylieShib' with a Shiba dog mascot, 'To the Moon' tagline, and space theme, 1500x500 pixels, PNG."
   - Download as `dex-banner.png`.
6. **Image Editing with Photoshop or Free Alternative:**
   - **Why Edit?** AI-generated images might need cropping (e.g., remove unwanted backgrounds), resizing (e.g., exact 500x500 for logo), or adding typography (e.g., token name/symbol). Photoshop offers advanced tools; GIMP is a free option.
   - **Steps:**
     - Open each image (e.g., `logo.png`) in Photoshop or GIMP.
     - **Crop Background:** Use the "Magic Wand" or "Lasso" tool to select and remove unwanted areas, refine edges.
     - **Resize:** Go to "Image > Image Size," set logo to 500x500 pixels, banners to 1500x500 pixels.
     - **Add Typography:** Use the "Text" tool to add "[your token name]" or tagline if missing, matching the theme (e.g., bold red font).
     - **Save:** Export as PNG with transparent background (File > Export As > PNG).
   - **Tip:** If new to editing, watch a quick tutorial (e.g., YouTube search "GIMP basics") or ask Cursor Chat: "Guide me to crop and resize an image in Photoshop/GIMP."
7. **Store Images Locally:**
   - Create a folder `assets` in your `memecoin-site-day1` directory.
   - Move edited `logo.png`, `x-banner.png`, and `dex-banner.png` into `assets`.
   - **Note:** Images will be deployed to GitHub Pages in the Publishing step—keep them local for now.
8. **Prompt for Help:**
   - If the tool doesn't work, ask Cursor Chat: "How to generate images with Grok 4 and ChatGPT? Provide sample prompts for a memecoin mascot logo, X banner, and DEX banner."

### Task 4: Scaffold the Memecoin Website with Inspiration from Top Solana Memecoins
**Goal:** Create a single `index.html` file containing all HTML, CSS (in `<style>`), and JavaScript (in `<script>`) for a memecoin website, incorporating your AI-generated image URLs. Use recursive prompting in Cursor to refine the code prompt with inspiration from top Solana memecoin websites, leveraging colors from the images.

1. **Research Inspiration with Grok 4:**
   - Prompt Grok 4: "Suggest 5 top-performing memecoin websites on Solana from 2025 (as of 02:45 PM CDT, August 02, 2025). Provide their URLs, key design features (e.g., bold hero, meme galleries), and why they work for viral marketing."
   - Example output: "1. bonk.in - Bold hero with mascot, meme gallery, vibrant colors. 2. wifcoin.sol - Animated roadmap, community section, neon palette. 3. pepe.lol - Satirical design, tokenomics table, dark theme. 4. shibarmy.com - Dog-themed layout, how-to-buy guide, playful fonts. 5. metadog.io - Meta-narrative focus, interactive elements, sleek design."
   - Note these insights for your design.
2. **Refine the Prompt with Recursive Prompting in Cursor:**
   - Open Cursor Chat and prompt: "Generate a refined prompt for creating a single-page HTML memecoin website based on [your narrative]. Include a bold hero, vibrant tokenomics table, interactive roadmap, clear how-to-buy guide, community links (X, TG, DexScreener placeholders), a buy button (placeholder for Raydium), and responsive meme gallery, inspired by top Solana memecoin designs (e.g., bonk.in, wifcoin.sol). Use a color palette from [describe images, e.g., red and white for Shiba theme]."
   - Cursor will output a refined prompt, e.g., "Use primary color #FF0000 for backgrounds, secondary #FFFFFF for accents."
3. **Open Cursor Composer:**
   - Open Composer (Ctrl+Shift+I or Cmd+Shift+I).
4. **Paste Refined Prompt into Cursor Composer:**
   - Paste the refined prompt from Cursor Chat (replace with local image paths, e.g., `assets/logo.png`, and your selected concept; update to GitHub URLs in Publishing):
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
   - Cursor will generate `index.html` in your `memecoin-site-day1` folder with embedded `<style>` and `<script>` sections, using colors from the images and inspired designs. Save it.
5. **Review the Code:**
   - Open `index.html` in Cursor. Verify sections like `<section id="hero">`, `<table id="tokenomics">`, etc., are present, and the logo, social links, and buy button load via local paths (update to GitHub URLs in Publishing).
   - Check `<style>` for responsiveness, color usage (e.g., `background: #FF0000;`), and Solana-inspired elements (e.g., vibrant layout).
   - Check `<script>` for basic interactivity (e.g., console logs or event listeners).
6. **Test Locally:**
   - Open `index.html` in a browser (double-click or run `open index.html` in terminal).
   - Ensure all sections display correctly, the logo loads, colors match the images, and it's mobile-responsive (resize browser). If issues arise, ask Cursor Chat: "Fix my HTML/CSS layout in index.html or image loading errors."

### Task 5: Iterate on the Website
**Goal:** Enhance the single-page site with AI-generated improvements for interactivity, design, and additional inspiration from top Solana memecoins. Iteration involves either regenerating with a new direction or making small improvements like subtle animations, button styling, or typography changes, all through prompt engineering.

1. **Guidance on Iteration:**
   - **Regenerate with New Direction:** If the initial design feels off, prompt Cursor to start fresh with a new style (e.g., "Regenerate my index.html with a dark theme inspired by pepe.lol instead of the current design").
   - **Make Small Improvements:** Refine incrementally with prompts for subtle enhancements:
     - Add subtle animation effects (e.g., "Add a fade-in animation to the hero section").
     - Improve button styling (e.g., "Enhance the buy button with a gradient background and rounded corners").
     - Change typography (e.g., "Update all headings to use a bold, playful font inspired by shibarmy.com").
   - Use Composer for targeted prompts to avoid overwriting the whole file (e.g., "Update only the <style> tag...").
   - Test after each change to ensure functionality and aesthetics align with your vision.
2. **Add Interactivity:**
   - Prompt Cursor in Composer: "Add JavaScript in my index.html <script> tag to show an alert when clicking community links (e.g., 'Join our community!')."
3. **Enhance Design:**
   - Prompt Cursor in Composer: "Enhance my index.html <style> tag with a subtle fade-in animation for the hero section, inspired by wifcoin.sol."
4. **Improve Buy Button:**
   - Prompt Cursor in Composer: "Improve the buy button in my index.html hero section with a gradient background and rounded corners, ensuring mobile-friendliness."
5. **Adjust Typography:**
   - Prompt Cursor in Composer: "Change all headings in my index.html to use a bold, playful font inspired by shibarmy.com."
6. **Save Locally:**
   - Save changes to `index.html`.
7. **Verify Updates:**
   - Reopen `index.html` in a browser to see changes.
8. **Prompt for Help:**
   - If needed, ask Cursor Chat: "Suggest a new design direction for my index.html or small improvements based on top Solana memecoin websites like metadog.io."

### Task 6: Understand Memecoin Websites & AI
**Goal:** Learn the purpose of memecoin site elements and how AI simplifies development.

1. **Prompt Cursor for Explanations:**
   - Ask: "Explain why a memecoin website needs a hero, tokenomics, roadmap, how-to-buy, community, and meme gallery. How do they drive community engagement?"
   - Expected response:
     - Hero: Captures attention with bold branding.
     - Tokenomics: Builds trust with transparent supply/distribution.
     - Roadmap: Shows future plans to excite investors.
     - How-to-buy: Simplifies onboarding for new users.
     - Community: Drives engagement via social platforms.
     - Meme gallery: Uses humor for virality.
2. **AI in Web3 Quiz:**
   - Prompt Cursor: "Create a 3-question quiz about how AI helps build websites, generate images, and manage socials, with answers. Example: How does Grok 4 or Cursor make image creation easier?"
   - Example response:
     - Q: How does AI like Grok 4/Cursor help with images? A: Generates logos, banners, and memes from text prompts.
     - Q: What’s an AI prompt for socials? A: A request like "Write a tweet for a memecoin launch."
     - Q: How is AI changing web dev? A: Speeds up coding, asset creation, and social automation.
3. **Reflect:** In Cursor, create `notes.txt` and write: "How did AI help me with brainstorming, images, and site today?" (e.g., "Grok 4 brainstormed ideas, Cursor scaffolded the site!"). Save locally.

### Task 7: Publishing to GitHub Pages
**Goal:** Deploy your website and images to GitHub Pages using Cursor to generate SSH keys and set up GitHub authentication (no manual commands required).

1. **Generate SSH Keys with Cursor:**
   - Open Cursor Chat and prompt: "Generate SSH keys for me to authenticate with GitHub. Provide step-by-step guidance within Cursor to create the keys and add them to my GitHub account."
   - Follow Cursor’s instructions (e.g., it may guide you to a terminal within Cursor, generate keys like `id_rsa` and `id_rsa.pub`, and prompt you to copy the public key to GitHub under Settings > SSH and GPG keys > New SSH key).
2. **Set Up GitHub Authentication with Cursor:**
   - Prompt Cursor: "Set up GitHub authentication for my repository using the SSH keys you generated. Guide me to connect my local 'memecoin-site-day1' folder to GitHub and push my project."
   - Follow Cursor’s guidance (e.g., it may suggest creating a repo named `memecoin-site-day1`, linking it, and pushing with a prompt like "Push my local memecoin-site-day1 folder to GitHub").
3. **Deploy to GitHub Pages:**
   - Prompt Cursor: "Configure my GitHub repository to deploy the 'memecoin-site-day1' folder to GitHub Pages. Ensure the assets folder is included and set the source to the main branch."
   - Cursor will guide you to GitHub Settings > Pages, set the source to `main` branch, `/ (root)` folder, and verify deployment at `https://yourusername.github.io/memecoin-site-day1`.
4. **Update Image URLs:**
   - After deployment, prompt Cursor: "Update all image paths in my index.html to use GitHub Pages URLs (e.g., https://yourusername.github.io/memecoin-site-day1/assets/logo.png) based on the deployed assets folder."
   - Save and test the updated `index.html` locally.
5. **Prompt for Help:**
   - If issues arise, ask Cursor Chat: "Troubleshoot any GitHub authentication or deployment issues for my memecoin-site-day1 project."

## Cursor Prompts for Day 1
See `docs/daily_prompts.md` in the course repo for a full list.

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
- Brainstormed viral memecoin ideas using Grok 4 with recursive prompting, selected a concept with a strong narrative, and used Grok 4 for initial research/prompt creation, resulting in a prompt for Cursor.
- Generated an X banner, DEX banner, and mascot-focused logo using Grok 4 and ChatGPT, with recursive prompting for refinement, edited in Photoshop/GIMP, and stored locally.
- Built and iterated on a single-page memecoin website (`index.html`) with AI-generated assets using Cursor AI, pasting refined prompts from Grok 4, inspired by top Solana memecoin designs, including social links and a buy button.
- Used Cursor’s Composer and Chat to generate code and troubleshoot issues.
- Learned recursive prompting for better AI outputs.
- (Publishing Step) Learned to use Cursor to generate SSH keys and set up GitHub authentication for deployment.

## Next Steps
- Save your work locally in the `memecoin-site-day1` folder.
- Verify your local site by opening `index.html` in a browser.
- Tomorrow (Day 2): Dive into Building Your Memecoin Community with AI, potentially setting up Telegram and X to expand your project's reach.