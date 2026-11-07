# Ortho Handover (open, no sign-in)

index.html is a static page. Supabase stores the shared cases.

1. Create a free Supabase project.
2. SQL Editor: run setup.sql.
3. Copy the Project URL and the publishable key (Settings > API Keys) into CONFIG at the top of the script in index.html.
4. Upload index.html to a GitHub repo, then Settings > Pages > deploy from branch main, folder / (root).

Anyone with the link can read, add, edit and delete cases. Never paste a secret or service_role key into index.html.

Keeping the data available
- Supabase Free projects are paused after about 7 days of low activity. A paused project can be resumed from the dashboard (Resume project) within 1 year, with its data. Daily use keeps it active.
- The page keeps a copy of the last loaded list in each device's browser and shows it if the internet or the database is unreachable.
- Use the backup button regularly.
