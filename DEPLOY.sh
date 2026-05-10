#!/bin/bash
# ============================================================
# PUSH TO GITHUB — Run these commands on your local machine
# ============================================================
# 
# STEP 1: Copy the project2 folder to your local machine
# (if you're running this from the container, scp or download it)
#
# STEP 2: Create a NEW repo on GitHub called "project2" at:
#         https://github.com/new
#         Name: project2
#         Description: Mall of America Interactive Sales Deck
#         Public: YES
#         Do NOT initialize with README (we have one)
#
# STEP 3: Run these commands from inside the project2 folder:

cd project2   # or wherever you saved it

git remote add origin https://github.com/mohitjain1708/project2.git
git push -u origin main

# STEP 4: Enable GitHub Pages
# Go to: https://github.com/mohitjain1708/project2/settings/pages
# Source: Deploy from branch → main → / (root) → Save
# Your live URL will be: https://mohitjain1708.github.io/project2/

# ============================================================
# ALTERNATIVE: Deploy to Netlify (faster, recommended)
# ============================================================
# 1. Go to https://netlify.com
# 2. Sign in with GitHub
# 3. Click "Add new site" → "Import an existing project"
# 4. Connect to GitHub → select mohitjain1708/project2
# 5. Build command: (leave empty)
# 6. Publish directory: . (dot, the root)
# 7. Click "Deploy site"
# Live in ~30 seconds!
