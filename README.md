# A Little Birthday Surprise ❤️
Static site (no build step). Surprises are stored in Supabase (free tier); the site is hosted on GitHub Pages.

## 1. Supabase
1. Create a free project at supabase.com.
2. SQL Editor → paste `supabase.sql` → Run.
3. Project Settings → API: copy the **Project URL** and the **anon public** key (never the service_role key).

## 2. Configure
In `index.html` find `const CFG=` and paste your URL and anon key.
Optional: replace `song.mp3` with your own default song.

## 3. Host on GitHub Pages
1. Create a GitHub repo and upload these files (`index.html`, `song.mp3`, `README.md`, `supabase.sql`).
2. Settings → Pages → Source: *Deploy from a branch* → `main` / root → Save.
3. Your site appears at `https://<user>.github.io/<repo>/`. (Netlify/Vercel also work: drag the folder in.)

## 4. Use it
Open your site, create a surprise, copy the link (`.../#abc123`) and send it. The link works on any device, with no sign-in. Links use `#`, so refresh works without extra routing setup.

## Notes
- The anon key is meant to be public; the SQL lets visitors create surprises and read one only by its exact random ID.
- Anyone who finds your site can create surprises (free-tier storage is limited). Keep the URL private if that matters.
